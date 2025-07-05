# Imagen base con Python 3.9
FROM python:3.9-slim

# Establecer directorio de trabajo
WORKDIR app/

# Copiar requirements.txt
COPY ./app/SM_project/requirements.txt .

# Instalar dependencias
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiar el resto del código Django
COPY ./app/SM_project/ .

# Exponer el puerto 8000
EXPOSE 8000

# Ejecutar servidor con Gunicorn
CMD ["gunicorn", "sm_project.wsgi:application", "--bind", "0.0.0.0:8000"]

# entrypoint
# Copiar entrypoint.sh al contenedor
COPY ./backend/entrypoint.sh /entrypoint.sh

# Dar permisos
RUN chmod +x /entrypoint.sh

# Usar como entrypoint
ENTRYPOINT ["/entrypoint.sh"]