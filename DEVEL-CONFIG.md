# Entorno de Desarrollo Local — Gateway Ciudadano

## Descripción

Este entorno de desarrollo permite ejecutar localmente el sistema ciudadano de Sello Legítimo utilizando Docker Compose.

El entorno incluye:

- Gateway con Caddy
- Frontend ciudadano
- Microservicios backend
- PostgreSQL por servicio
- Redis por servicio
- Configuración aislada para desarrollo local

---

# Objetivo

El objetivo de este entorno es permitir el desarrollo e integración local de los microservicios ciudadanos sin afectar el entorno de producción.

Toda la configuración local se encuentra aislada en la carpeta:

```text
devel-config/
```

---

# Arquitectura General

El flujo general del sistema es:

```text
Frontend → Gateway (Caddy) → Microservicio → PostgreSQL / Redis
```

---

# Estructura del Proyecto

```text
gateway/
├── devel-config/
│   └── caddy/
│       ├── Caddyfile
│       └── ciudadano/
│           ├── ciudadano.conf
│           └── endpoints/
│               ├── backend.conf
│               └── frontend.conf
│
├── docker-compose.ciudadano.local.yml
```

---

# Función de los Archivos

## Caddyfile

Archivo principal de configuración del gateway.

Ubicación:

```text
devel-config/caddy/Caddyfile
```

Define:
- configuración global de Caddy
- certificados locales
- imports de configuraciones ciudadanas

---

## ciudadano.conf

Define el dominio local del sistema ciudadano.

Ubicación:

```text
devel-config/caddy/ciudadano/ciudadano.conf
```

Se encarga de:
- configurar el host ciudadano
- importar endpoints backend y frontend

---

## backend.conf

Define las rutas API del gateway hacia los microservicios.

Ubicación:

```text
devel-config/caddy/ciudadano/endpoints/backend.conf
```

Responsabilidades:
- enrutar peticiones REST
- realizar reverse proxy a los microservicios
- conectar frontend con backend

---

## frontend.conf

Define el proxy hacia el frontend React.

Ubicación:

```text
devel-config/caddy/ciudadano/endpoints/frontend.conf
```

Responsabilidad:
- exponer el frontend mediante Caddy

---

## docker-compose.ciudadano.local.yml

Archivo principal para levantar el entorno local.

Responsabilidades:
- crear containers
- crear red Docker
- levantar bases de datos
- levantar Redis
- levantar gateway
- levantar frontend
- levantar microservicios

---

# Servicios del Entorno

## Frontend

| Servicio | Descripción |
|---|---|
| frontend | Portal ciudadano |

---

## Backend

| Servicio |
|---|
| citizen-query-service |
| elections-query-service |
| results-service |
| transparency-service |

---

## Bases de Datos

Cada microservicio posee su propia base de datos PostgreSQL.

---

## Redis

Cada microservicio posee su propia instancia Redis para cache.

---

# Funcionamiento del Gateway

El gateway utiliza Caddy como reverse proxy.

El gateway recibe las peticiones desde el frontend y las redirige al microservicio correspondiente utilizando las reglas definidas en:

```text
backend.conf
```

Ejemplos:

```text
/api/v1/elections
/api/v1/results
/api/v1/transparency
/api/v1/citizen
```

---

# Configuración Local del Dominio

Agregar en:

```text
/etc/hosts
```

la siguiente entrada:

```text
127.0.0.1 ciudadano.sello-legitimo.site
```

---

# Cómo Ejecutar el Entorno

Ubicarse dentro de:

```bash
gateway/
```

---

## Levantar entorno

```bash
docker compose -f docker-compose.ciudadano.local.yml up --build -d
```

---

## Ver containers

```bash
docker ps
```

---

## Ver logs

```bash
docker compose -f docker-compose.ciudadano.local.yml logs -f
```

---

## Reiniciar gateway

```bash
docker restart gateway
```

---

## Apagar entorno

```bash
docker compose -f docker-compose.ciudadano.local.yml down
```

---

# Acceso al Sistema

Frontend local:

```text
https://ciudadano.sello-legitimo.site:8092
```

---

# Consideraciones

- Todas las configuraciones locales están aisladas en `devel-config`
- No se modifica ninguna configuración de producción
- El gateway replica el comportamiento del entorno real
- Docker Compose centraliza toda la orquestación local
