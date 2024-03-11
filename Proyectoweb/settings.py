
#user boris2 passwodr 1234
import os
from pathlib import Path
from django.contrib.messages import constants as mensajes_de_error#para mostrar mensajes de error

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-gttpc7nm4i)ckdy7hxuqhrx%t*kqv12=7^s@=!(s^ai^jkz$zn'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
#DEBUG = 'RENDER' not in os.environ

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'proyectoWebApp',#agregamos la app creada
    'servicios',#agregamos la app creada
    'blog',#agregamos la app creada
    'contacto',#agregamos la app creada
    'tienda',#agregamos la app creada
    'carro',#agregamos la app creada
    'autenticacion',#agregamos la app creada
    'crispy_forms',
    'crispy_bootstrap4',#agregamos la app para el formulario
    'pedidos',#agregamos la app creada|
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'Proyectoweb.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'carro.context_processor.importe_total_carro'#agregamos esta linea para poder usar la variable global importe_total_carro
            ],
        },
    },
]

WSGI_APPLICATION = 'Proyectoweb.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.1/topics/i18n/

#LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = 'es-eu'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = 'static/'

MEDIA_URL='media/'#agregamos esta linea para ubicar donde guardar la carpeta de imagenes
MEDIA_ROOT =os.path.join(BASE_DIR, 'media')#agregamos esta linea para ubicar donde guardar la carpeta de imagenes

# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

#configuracion de correo electorinico
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'#para enviar correos
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = "borisanthony03@gmail.com"
EMAIL_HOST_PASSWORD = "aihiisukfaqmchhc"

#configuracion de crispy forms
CRISPY_ALLOWED_TEMPLATE_PACK = 'bootstrap4'#para usar el formulario de bootstrap
CRISPY_TEMPLATE_PACK = 'bootstrap4'#para usar el formulario de bootstrap

#configuracion de mensajes de error
MESSAGE_TAGS = {
    mensajes_de_error.DEBUG: 'debug',
    mensajes_de_error.ERROR: 'danger',
    mensajes_de_error.INFO: 'info',
    mensajes_de_error.SUCCESS: 'success',
    mensajes_de_error.WARNING: 'warning',
}#para mostrar mensajes de error
