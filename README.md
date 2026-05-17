# 🚀 WordPress Docker + Vagrant | Automatización DevOps

## 📌 Descripción del proyecto

Este proyecto implementa un entorno automatizado para el despliegue de una aplicación WordPress utilizando una arquitectura basada en:

- 🖥️ Vagrant (virtualización)
- 🐳 Docker (contenedores)
- 📦 Docker Compose (orquestación)
- 🌐 GitHub (control de versiones)

El objetivo es eliminar procesos manuales de despliegue y garantizar un entorno reproducible, automatizado y fácilmente replicable con una sola orden.

---

# 🏗️ 1. Arquitectura implementada

El sistema está diseñado bajo una arquitectura en capas que separa claramente la infraestructura, la ejecución y el código:

## 🔹 Capa de control de versiones
- GitHub actúa como repositorio central del proyecto.
- Contiene el código de la aplicación y los scripts de despliegue.
- Permite actualización y versionado del contenido.

## 🔹 Capa de virtualización
- Vagrant crea una máquina virtual basada en Ubuntu Jammy 22.04.
- Garantiza un entorno homogéneo independientemente del sistema host.

## 🔹 Capa de contenedores
- Docker ejecuta los servicios necesarios.
- Docker Compose orquesta el contenedor de WordPress.
- El sistema se despliega de forma aislada y reproducible.

## 🔹 Capa de aplicación
- WordPress se ejecuta dentro del contenedor.
- El contenido web se sirve desde la carpeta sincronizada del proyecto.

---

# ⚙️ 2. Funcionamiento del sistema

El flujo de ejecución es completamente automatizado:

1. El usuario ejecuta:
```bash
vagrant up
```

2. Vagrant realiza automáticamente:
- Creación de la máquina virtual Ubuntu
- Instalación de Docker y Docker Compose
- Clonado del repositorio de GitHub
- Ejecución del script de provisioning

3. Docker Compose levanta el servicio WordPress:
```bash
docker-compose up -d
```

4. El sistema queda accesible en el navegador.

---

## 🔁 Flujo de actualización

Cuando se realizan cambios en el repositorio:

1. Se modifica el código en GitHub.
2. Se suben los cambios:
```bash
git add .
git commit -m "Actualización del contenido"
git push
```

3. En la máquina virtual se ejecuta:
```bash
vagrant provision
```

✔ Se descargan los cambios  
✔ Se actualizan los archivos del sistema  
✔ Se reinician los contenedores si es necesario  

---

# 🚀 3. Instrucciones de despliegue paso a paso

## 🔹 Paso 1: Clonar el repositorio

```bash
git clone https://github.com/EnriqueFernandez-dam/wordpress-docker-project.git
cd wordpress-docker-project
```

---

## 🔹 Paso 2: Iniciar el entorno virtual

```bash
vagrant up
```

Este comando:
- Crea la máquina virtual Ubuntu
- Instala dependencias (Docker, Docker Compose)
- Clona el repositorio dentro de la VM
- Despliega WordPress automáticamente

---

## 🔹 Paso 3: Acceder a la aplicación

Abrir en el navegador:

```
http://localhost:8081
```

---

## 🔹 Paso 4: Gestión del entorno

```bash
vagrant ssh       # acceder a la VM
vagrant halt      # apagar la VM
vagrant provision # actualizar el sistema
```

---

# 🔄 4. Ejemplo de actualización del contenido

## 🔹 1. Modificar archivo PHP

```php
<?php
echo "<h1>Nueva versión del sistema</h1>";
?>
```

---

## 🔹 2. Subir cambios a GitHub

```bash
git add .
git commit -m "Actualización del contenido"
git push
```

---

## 🔹 3. Aplicar cambios en el sistema

```bash
vagrant provision
```

---

## 🔹 Resultado

- El sistema descarga los cambios desde GitHub
- Actualiza los archivos en la máquina virtual
- Refresca el contenedor de WordPress
- Los cambios se reflejan inmediatamente en el navegador

---

# 📁 Estructura del proyecto

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

# 🐳 Docker Compose

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

# 🖥️ Vagrantfile

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

# ⚙️ Provisioning automático

El script `provision.sh` automatiza:

- Instalación de Docker
- Instalación de Docker Compose
- Clonado del repositorio
- Despliegue de contenedores

---

# 🧪 Comandos útiles

## Vagrant
```bash
vagrant up
vagrant ssh
vagrant provision
vagrant halt
```

## Docker
```bash
docker ps
docker-compose up -d
docker-compose down
docker-compose logs -f
```

---

# 🎯 Conclusión

Este proyecto implementa un entorno DevOps completo que integra virtualización, contenedores y control de versiones, permitiendo un despliegue automatizado, reproducible y escalable de una aplicación WordPress.
