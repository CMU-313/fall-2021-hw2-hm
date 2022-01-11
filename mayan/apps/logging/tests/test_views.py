from django.contrib.auth import get_user_model
from django.contrib.contenttypes.models import ContentType

from mayan.apps.acls.classes import ModelPermission
from mayan.apps.tests.tests.base import GenericViewTestCase

from ..models import ErrorLogEntry
from ..permissions import permission_error_log_view

from .literals import TEST_ERROR_LOG_ENTRY_RESULT


class LoggingViewTestMixin:
    def _request_object_error_log_list(self):
        content_type = ContentType.objects.get_for_model(model=self.test_user)

        return self.get(
            viewname='logging:object_error_list', kwargs={
                'app_label': content_type.app_label,
                'model': content_type.model,
                'object_id': self.test_user.pk
            }
        )


class LogingViewTestCase(LoggingViewTestMixin, GenericViewTestCase):
    def _create_error_log_entry(self):
        ModelPermission.register(
            model=get_user_model(), permissions=(permission_error_log_view,)
        )
        ErrorLogEntry.objects.register(model=get_user_model())

        self.error_log_entry = self.test_user.error_logs.create(
            result=TEST_ERROR_LOG_ENTRY_RESULT
        )

    def test_object_error_list_view_no_permissions(self):
        self._create_test_user()
        self._create_error_log_entry()

        response = self._request_object_error_log_list()
        self.assertNotContains(
            response=response, text=TEST_ERROR_LOG_ENTRY_RESULT,
            status_code=403
        )

    def test_object_error_list_view_with_access(self):
        self._create_test_user()
        self._create_error_log_entry()

        self.grant_access(
            obj=self.test_user, permission=permission_error_log_view
        )

        response = self._request_object_error_log_list()
        self.assertContains(
            response=response, text=TEST_ERROR_LOG_ENTRY_RESULT,
            status_code=200
        )
