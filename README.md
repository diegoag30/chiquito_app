# trabajo_final_integrador_ttps_ruby

Aplicación para manejo de enlaces cortos, desarrollado en rails.

---

## Herramientas y gemas utilizadas

Para el inicio de session se utilizo la gema **devise**

Para la creacion de informacion en el archivo **seeds.rb** se utilizo la gema **Faker**

Para la actualizacion de javascript sin recargar la pagina se uso la gema **stimulus-rails**

Para el inicio de session se utilizo la gema **devise**

Para el stilo se utilizo la gema **bootstrap**

Para la generacion de slugs se utilizo la gema **nanoid**

## Para correr la aplicacion

---

Una vez descargado el codigo se debe ejecutar:

```bash
#Instalacion de gemas
bundle init
```

Para el uso de algunas funciones javascript se utiliza stimulus, por lo cula se deberia correr:

```bash
#Instalacion de stimulus
rails stimulus:install
```

Para iniciar y poblar la base de datos:

```bash
#Reinicia la base de datos(Crea y limpia la db)
rails db:reset

#En caso de seer necesario, para poblar la base de datos
rails db:seed
```

## Consideraciones

El uso de links de momento se utiliza de la forma http://127.0.0.1:3000/links/:slug
donde slug es el valor dado por la columna de dicho nombre.

Por el momento redirige a https://{public_url} sin validar la url.
