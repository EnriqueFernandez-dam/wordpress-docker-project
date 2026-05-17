# 🚀 WordPress Docker + Vagrant | Automatización DevOps

## 📌 Descripción del proyecto

Este proyecto implementa un entorno automatizado para el despliegue de una aplicación WordPress utilizando una arquitectura basada en:

- 🖥️ Vagrant (virtualización)
- 🐳 Docker (contenedores)
- 📦 Docker Compose (orquestación)
- 🌐 GitHub (control de versiones)

El objetivo es eliminar procesos manuales de despliegue y garantizar un entorno reproducible con una sola orden.

---

## 🏗️ Arquitectura del sistema

El sistema sigue una arquitectura en capas:

- **GitHub** → repositorio de código
- **Vagrant** → creación de máquina virtual Ubuntu
- **Docker** → ejecución de contenedores
- **Docker Compose** → orquestación de servicios
- **WordPress** → aplicación final

---

## 📁 Estructura del proyecto

```
ProyectoDocker/
│
├── Vagrantfile
├── docker-compose.yml
├── provision.sh
│
└── web/
    └── index.php
```

---

## 🚀 Requisitos previos

Antes de ejecutar el proyecto necesitas:

- VirtualBox instalado
- Vagrant instalado
- Conexión a Internet

---

## ⚙️ Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/EnriqueFernandez-dam/wordpress-docker-project.git
cd wordpress-docker-project
```

---

### 2. Levantar el entorno

```bash
vagrant up
```

Este comando:

- Crea una máquina virtual Ubuntu (Jammy 22.04)
- Instala Docker y Docker Compose
- Clona el repositorio dentro de la VM
- Despliega los contenedores automáticamente

---

### 3. Acceder a la aplicación

Abrir en el navegador:

```
http://localhost:8081
```

---

## 🔄 Sistema de actualización automática

### 1. Modificar el código

```php
<?php
echo "<h1>Nueva versión del sistema</h1>";
?>
```

---

### 2. Subir cambios a GitHub

```bash
git add .
git commit -m "Actualización del contenido"
git push
```

---

### 3. Aplicar cambios en la VM

```bash
vagrant provision
```

✔ Descarga cambios desde GitHub  
✔ Actualiza archivos en la VM  
✔ Reinicia contenedores si es necesario  

---

## 🐳 Docker Compose

```yaml
version: '3.8'

services:

  wordpress:
    image: wordpress:latest
    container_name: wordpress
    ports:
      - "8080:80"
    volumes:
      - ./web:/var/www/html
    restart: always
```

---

## 🖥️ Vagrantfile

```ruby
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 8080, host: 8081

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "provision.sh"

end
```

---

## ⚙️ Provisioning (automatización)

El script `provision.sh` se encarga de:

- Actualizar el sistema
- Instalar Docker y Docker Compose
- Clonar el repositorio
- Levantar los contenedores

---

## 🧪 Comandos útiles

### Vagrant

```bash
vagrant up        # iniciar entorno
vagrant ssh       # acceder a la VM
vagrant provision # actualizar entorno
vagrant halt      # detener VM
```

### Docker

```bash
docker ps
docker-compose up -d
docker-compose down
docker-compose logs -f
```

---

## 🎯 Objetivo del proyecto

- Automatizar el despliegue de WordPress
- Eliminar procesos manuales
- Garantizar entornos reproducibles
- Integrar control de versiones con GitHub

---

## 📊 Beneficios

- ✔ Entorno reproducible
- ✔ Despliegue automático
- ✔ Menos errores humanos
- ✔ Integración DevOps básica
- ✔ Fácil mantenimiento

---

## 🔮 Mejoras futuras

- CI/CD con GitHub Actions
- Base de datos persistente (MySQL/MariaDB)
- Reverse proxy (Nginx)
- Separación dev / producción
- Monitorización del sistema

---

## 🧾 Conclusión

Este proyecto simula un entorno DevOps real combinando virtualización, contenedores y control de versiones para automatizar completamente el despliegue de una aplicación WordPress.
