# Usa una imagen base con .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Define el directorio de trabajo
WORKDIR /app

# Copia el script de configuración
COPY entrypoint.sh /entrypoint.sh

# Da permisos de ejecución al script
RUN chmod +x /entrypoint.sh

# Ejecuta el script
ENTRYPOINT ["/entrypoint.sh"]
