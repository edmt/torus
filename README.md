## Torus

**Torus** es el **"bus de eventos"** de ReactiveGrid. Es el sistema devorador de mensajes que funciona como columna vertebral de un cluster de ReactiveGrid.

![alt text](architecture-basic.png "Arquitectura")

El nombre del proyecto está dado por el toro topológico.

Además, rosquillas.

![alt text](torus.jpg "Rosquillas...")


## Instalación (desarrollo)

### Dependencias
- [Oracle VM VirtualBox](https://www.virtualbox.org)
- [Vagrant](http://www.vagrantup.com)

La idea es trabajar en una máquina virtual creada con Vagrant, y dentro de ésta, con contenedores de docker.

> **Importante**: Docker requiere un proceso para ejecutar un contenedor. Los contenedores no se pueden iniciar sin un proceso, y los contenedores mueren instantáneamente cuando el proceso se detiene.

1. Clona este repositorio.

        $ git clone https://github.com/danioso/torus.git

2. Posiciónate en el directorio *setup*.

        $ cd torus/setup

3. Instalamos el plugin para vagrant *"vagrant-vbguest"* para sincronizar los *"VirtualBox Guest Additions"*.

        $ vagrant plugin install vagrant-vbguest

4. Arranca la máquina virtual

        $ vagrant up

    Sólo en el caso de que los *"VirtualBox Guest Additions"* se instalen, es necesario reiniciar la máquina virtual:

        $ vagrant reload

5. Conéctate a la máquina virtual vía ssh

        $ vagrant ssh

6. Instala el kernel 3.8 de Linux

        (guest) $ bash /vagrant/install-linux-kernel-3.8.sh

    Esta acción requiere reiniciar la máquina, por lo que perderás tu sesión de ssh.

7. Instala docker

    Es necesario reiniciar la máquina virtual e iniciar sesión via ssh.

        $ vagrant reload && vagrant ssh
        (guest) $ bash /vagrant/install-docker-latest.sh
