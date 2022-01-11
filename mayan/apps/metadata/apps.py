from __future__ import absolute_import, unicode_literals

import logging

from django.apps import apps
from django.db.models.signals import post_delete, post_save
from django.utils.translation import ugettext_lazy as _

from kombu import Exchange, Queue

from mayan.apps.acls import ModelPermission
from mayan.apps.acls.links import link_acl_list
from mayan.apps.acls.permissions import permission_acl_edit, permission_acl_view
from mayan.apps.common import (
    MayanAppConfig, menu_facet, menu_list_facet, menu_multi_item, menu_object,
    menu_secondary, menu_setup, menu_sidebar
)
from mayan.apps.common.classes import ModelAttribute, ModelField
from mayan.apps.common.widgets import TwoStateWidget
from mayan.apps.documents.search import document_page_search, document_search
from mayan.apps.documents.signals import post_document_type_change
from mayan.apps.events import ModelEventType
from mayan.apps.events.links import (
    link_events_for_object, link_object_event_types_user_subcriptions_list,
)
from mayan.apps.events.permissions import permission_events_view
from mayan.celery import app
from mayan.apps.navigation import SourceColumn

from .events import (
    event_document_metadata_added, event_document_metadata_edited,
    event_document_metadata_removed, event_metadata_type_edited,
    event_metadata_type_relationship
)
from .handlers import (
    handler_post_document_type_metadata_type_add,
    handler_post_document_type_metadata_type_delete,
    handler_post_document_type_change_metadata, handler_index_document,
)
from .links import (
    link_document_metadata_add, link_document_metadata_edit,
    link_document_multiple_metadata_add, link_document_multiple_metadata_edit,
    link_document_multiple_metadata_remove, link_document_metadata_remove,
    link_document_metadata_view, link_document_type_metadata_types,
    link_metadata_type_create, link_metadata_type_delete,
    link_metadata_type_document_types, link_metadata_type_edit,
    link_metadata_type_list,
)
from .methods import method_get_metadata
from .permissions import (
    permission_document_metadata_add, permission_document_metadata_edit,
    permission_document_metadata_remove, permission_document_metadata_view,
    permission_metadata_type_delete, permission_metadata_type_edit,
    permission_metadata_type_view
)
from .queues import *  # NOQA
from .search import metadata_type_search  # NOQA
from .widgets import widget_get_metadata_string

logger = logging.getLogger(__name__)


class MetadataApp(MayanAppConfig):
    app_namespace = 'metadata'
    app_url = 'metadata'
    has_rest_api = True
    has_tests = True
    name = 'mayan.apps.metadata'
    verbose_name = _('Metadata')

    def ready(self):
        super(MetadataApp, self).ready()
        from actstream import registry

        from .wizard_steps import WizardStepMetadata  # NOQA

        Document = apps.get_model(
            app_label='documents', model_name='Document'
        )
        DocumentPageSearchResult = apps.get_model(
            app_label='documents', model_name='DocumentPageSearchResult'
        )

        DocumentType = apps.get_model(
            app_label='documents', model_name='DocumentType'
        )

        DocumentMetadata = self.get_model('DocumentMetadata')
        DocumentTypeMetadataType = self.get_model('DocumentTypeMetadataType')
        MetadataType = self.get_model('MetadataType')

        Document.add_to_class(
            name='get_metadata', value=method_get_metadata
        )

        ModelAttribute(model=Document, name='get_metadata')

        ModelField(
            label=_('Metadata type name'), model=Document,
            name='metadata__metadata_type__name'
        )
        ModelField(
            label=_('Metadata type value'), model=Document,
            name='metadata__value',
        )

        ModelEventType.register(
            model=Document, event_types=(
                event_document_metadata_added,
                event_document_metadata_edited,
                event_document_metadata_removed,
            )
        )

        ModelEventType.register(
            model=MetadataType, event_types=(
                event_document_metadata_added,
                event_document_metadata_edited,
                event_document_metadata_removed,
                event_metadata_type_edited,
                event_metadata_type_relationship,
            )
        )

        ModelEventType.register(
            model=DocumentType, event_types=(
                event_metadata_type_relationship,
            )
        )

        ModelPermission.register(
            model=Document, permissions=(
                permission_document_metadata_add,
                permission_document_metadata_edit,
                permission_document_metadata_remove,
                permission_document_metadata_view,
            )
        )
        ModelPermission.register(
            model=MetadataType, permissions=(
                permission_acl_edit, permission_acl_view,
                permission_events_view, permission_metadata_type_delete,
                permission_metadata_type_edit, permission_metadata_type_view
            )
        )

        SourceColumn(
            func=widget_get_metadata_string, source=Document
        )

        SourceColumn(
            func=widget_get_metadata_string, kwargs={'attribute': 'document'},
            source=DocumentPageSearchResult,
        )

        SourceColumn(
            attribute='metadata_type', is_identifier=True,
            is_sortable=True, source=DocumentMetadata
        )
        SourceColumn(
            attribute='value', is_sortable=True, source=DocumentMetadata
        )
        SourceColumn(
            attribute='is_required', source=DocumentMetadata,
            widget=TwoStateWidget
        )
        SourceColumn(
            attribute='label', is_identifier=True, is_sortable=True,
            source=MetadataType
        )
        SourceColumn(attribute='name', is_sortable=True, source=MetadataType)

        app.conf.task_queues.append(
            Queue('metadata', Exchange('metadata'), routing_key='metadata'),
        )

        app.conf.task_routes.update(
            {
                'mayan.apps.metadata.tasks.task_remove_metadata_type': {
                    'queue': 'metadata'
                },
                'mayan.apps.metadata.tasks.task_add_required_metadata_type': {
                    'queue': 'metadata'
                },
            }
        )

        document_search.add_model_field(
            field='metadata__metadata_type__name', label=_('Metadata type')
        )
        document_search.add_model_field(
            field='metadata__value', label=_('Metadata value')
        )

        document_page_search.add_model_field(
            field='document_version__document__metadata__metadata_type__name',
            label=_('Metadata type')
        )
        document_page_search.add_model_field(
            field='document_version__document__metadata__value',
            label=_('Metadata value')
        )

        menu_facet.bind_links(
            links=(link_document_metadata_view,), sources=(Document,)
        )
        menu_list_facet.bind_links(
            links=(link_document_type_metadata_types,), sources=(
                DocumentType,
            )
        )
        menu_list_facet.bind_links(
            links=(
                link_acl_list, link_metadata_type_document_types,
                link_object_event_types_user_subcriptions_list,
                link_events_for_object,
            ), sources=(MetadataType,)
        )
        menu_multi_item.bind_links(
            links=(
                link_document_multiple_metadata_add,
                link_document_multiple_metadata_edit,
                link_document_multiple_metadata_remove
            ), sources=(Document,)
        )
        menu_object.bind_links(
            links=(
                link_metadata_type_edit, link_metadata_type_delete,
            ), sources=(MetadataType,)
        )
        menu_secondary.bind_links(
            links=(
                link_metadata_type_list, link_metadata_type_create
            ), sources=(
                MetadataType, 'metadata:metadata_type_list',
                'metadata:metadata_type_create'
            )
        )
        menu_setup.bind_links(links=(link_metadata_type_list,))
        menu_sidebar.bind_links(
            links=(
                link_document_metadata_add, link_document_metadata_edit,
                link_document_metadata_remove
            ), sources=(
                'metadata:document_metadata_add',
                'metadata:document_metadata_edit',
                'metadata:document_metadata_remove',
                'metadata:document_metadata_view'
            )
        )

        post_delete.connect(
            dispatch_uid='metadata_handler_post_document_type_metadata_type_delete',
            receiver=handler_post_document_type_metadata_type_delete,
            sender=DocumentTypeMetadataType
        )
        post_document_type_change.connect(
            dispatch_uid='metadata_handler_post_document_type_change_metadata',
            receiver=handler_post_document_type_change_metadata,
            sender=Document
        )
        post_save.connect(
            dispatch_uid='metadata_handler_post_document_type_metadata_type_add',
            receiver=handler_post_document_type_metadata_type_add,
            sender=DocumentTypeMetadataType
        )

        # Index updating

        post_delete.connect(
            dispatch_uid='metadata_handler_index_document_delete',
            receiver=handler_index_document,
            sender=DocumentMetadata
        )
        post_save.connect(
            dispatch_uid='metadata_handler_index_document_save',
            receiver=handler_index_document,
            sender=DocumentMetadata
        )

        registry.register(MetadataType)
        registry.register(DocumentTypeMetadataType)
