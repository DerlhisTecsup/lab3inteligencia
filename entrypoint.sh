#!/bin/sh

# Define las rutas de los archivos en tu máquina local
LOCAL_TODO_RAZOR="/app/Todo.razor"
LOCAL_NAV_MENU_RAZOR="/app/NavMenu.razor"
LOCAL_TODO_ITEM_CS="/app/TodoItem.cs"

# Crear un nuevo proyecto Blazor
dotnet new blazor -o BlazorApp

# Cambia al directorio del proyecto Blazor
cd BlazorApp

# Crear el componente de la lista de tareas
dotnet new razorcomponent -n Todo -o Components/Pages

# Copiar los archivos desde /app (el directorio montado) a los directorios del proyecto
cp $LOCAL_TODO_ITEM_CS TodoItem.cs

cd Components/Layout

rm NavMenu.razor
cp $LOCAL_NAV_MENU_RAZOR NavMenu.razor

cd ../Pages

rm Todo.razor
cp $LOCAL_TODO_RAZOR Todo.razor

# Ejecuta el proyecto Blazor en el puerto 5000
dotnet run --urls 'http://0.0.0.0:5000'
