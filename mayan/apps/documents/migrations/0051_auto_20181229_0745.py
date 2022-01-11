from __future__ import unicode_literals

from django.db import migrations, models

import mayan.apps.common.classes
import mayan.apps.documents.utils
import mayan.apps.storage.classes


class Migration(migrations.Migration):

    dependencies = [
        ('documents', '0050_duplicateddocumentproxy'),
    ]

    operations = [
        migrations.AlterField(
            model_name='documentversion',
            name='file',
            field=models.FileField(
                storage=mayan.apps.storage.classes.FakeStorageSubclass(),
                upload_to=mayan.apps.documents.utils.document_uuid_function,
                verbose_name='File'
            ),
        ),
    ]
