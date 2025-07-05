#!/bin/bash

# Detener el script si ocurre un error
set -e

echo "Aplicando migraciones de la base de datos..."
python ./SM_project/manage.py migrate
echo "migraciones aplicadas correctamente."


echo "Recolectando archivos estáticos..."
python ./SM_project/manage.py collectstatic --noinput
echo "Archivos estáticos recolectados correctamente."

echo "iniciando el servidor Gunicorn..."
exec gunicorn sm_project.wsgi:application --chdir SM_project --bind 0.0.0.0:8000
echo "Servidor Gunicorn iniciado correctamente."
