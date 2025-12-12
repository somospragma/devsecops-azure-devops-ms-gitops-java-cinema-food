# 🍿 Cinema Food Service

**Microservicio Backend** para la gestión de comida y bebidas del sistema Cinema.

## 📋 Descripción

Este microservicio maneja:
- Catálogo de productos de comida y bebidas
- Gestión de inventario
- Procesamiento de pedidos
- APIs REST para el frontend

## 🎬 Arquitectura Completa del Sistema Cinema

### 📁 Estructura de Repositorios

#### 🔧 Repositorios de Aplicación
- **`cinema-food/`** (ESTE REPO) - Microservicio para gestión de comida y bebidas
- **`cinema-seats/`** - Microservicio para gestión de asientos y reservas
- **`cinema-app/`** - Aplicación web frontend del sistema cinema

#### 🚀 Repositorios de Infraestructura
- **`pipeline-templates-helm-argo/`** - Templates de pipelines CI/CD
- **`manifest-k8s/`** - Repositorio GitOps con manifiestos Kubernetes (**ArgoCD monitorea este**)
- **`config-argocd-minikube/`** - Recursos para configurar ArgoCD y Minikube

### 🔄 Flujo GitOps

```
cinema-food (ESTE REPO) 
    ↓ commit/push
Azure Pipeline 
    ↓ usa templates Java
pipeline-templates-helm-argo/Backend/gradle/
    ↓ actualiza manifiestos
manifest-k8s/helm-charts/cinema-food/
    ↓ ArgoCD detecta cambios
Kubernetes Deployment
```

**Cada commit aquí activa automáticamente todo el flujo GitOps hasta producción.**

> 📖 **Ver [README Principal](../README.md)** para el diagrama completo y detalles de la arquitectura.

## 🏗️ Arquitectura del Proyecto



## 🚀 Tecnologías

- **Java 17**
- **Spring Boot 3.x**
- **Gradle** (build tool)
- **Docker** (containerización)
- **Kubernetes** (orquestación)

## 🛠️ Desarrollo Local

### Prerequisitos
- Java 17+
- Docker
- Gradle

### Ejecutar localmente
```bash
# Compilar
./gradlew build

# Ejecutar tests
./gradlew test

# Ejecutar aplicación
./gradlew bootRun
```

### Docker
```bash
# Construir imagen
docker build -t cinema-food .

# Ejecutar contenedor
docker run -p 8080:8080 cinema-food
```

## 🔄 Pipeline CI/CD

Cada commit a este repositorio:
1. **Trigger:** Azure Pipeline se ejecuta automáticamente
2. **Build:** Usa templates de `pipeline-templates-helm-argo/Backend/gradle/`
3. **Test:** Ejecuta tests unitarios e integración
4. **Docker:** Construye y publica imagen
5. **Deploy:** Actualiza `manifest-k8s/helm-charts/cinema-food/values-[env].yml`
6. **GitOps:** ArgoCD detecta cambios y despliega automáticamente

## 📡 API Endpoints

- `GET /api/food/menu` - Obtener menú completo
- `GET /api/food/categories` - Categorías de productos
- `POST /api/food/order` - Crear pedido
- `GET /api/food/order/{id}` - Estado del pedido

## 🧪 Testing

```bash
# Tests unitarios
./gradlew test

# Tests de integración
./gradlew integrationTest

# Coverage report
./gradlew jacocoTestReport
```

## 🤝 Contribución

1. Fork del repositorio
2. Crear feature branch: `git checkout -b feature/nueva-funcionalidad`
3. Commit cambios: `git commit -m 'Add nueva funcionalidad'`
4. Push branch: `git push origin feature/nueva-funcionalidad`
5. Crear Pull Request
6. **El pipeline CI/CD se encarga del deployment automático**

## 🔗 Repositorios Relacionados

- **[Cinema App](../cinema-app/)** - Frontend Angular
- **[Cinema Seats](../cinema-seats/)** - Microservicio de asientos
- **[Pipeline Templates](../pipeline-templates-helm-argo/)** - Templates CI/CD
- **[Manifest K8s](../manifest-k8s/)** - Manifiestos Kubernetes
- **[Config ArgoCD](../config-argocd-minikube/)** - Configuración ArgoCD