<h1>terminology</h1>

<h3><strong>docker ?</strong></h3>
    <p>
        docker is an open source containerization tool that manages isolated environments(containers)<br>
        the containers are provided with all the tools and dependencies needed to run a certain software<br>
        the key deference between containerization and virtualization is that a container<br>
        is light weight and a lot more faster to run unlike a virtual machine, the raison for<br>
        this is that the hypervisor virtualize hardware (RAM, CPU, STORAGE ...) and needs a new separate OS<br>
        on the other hand docker engine does an OS level virtualization, which means it uses the host kernel<br>
        to run and manage its containers in isolation.<br>
    </p>

<h3>container</h3>
    <p>
        a container is an isolated executable environment that is instantiated from a image by the docker engine<br>
        it can be started stopped and deleted it is used by devs to package there software and dependencies<br>
        to run on any target system and avoid the <strong>"it runs on my machine"<strong> problem.
    </p>

<h3>docker images</h3>
    <p>
        a docker image is a readonly template that packages all the libraries and system dependencies needed to run a certain software,<br>
        another to look at it is a blueprint or a snapshot to run containers since the docker engine initializes container from docker images<br>
        and the docker image does not change after initializing a container from it.
    </p>

<h3>why use docker</h3>
    <p>
        docker is a very useful piece of software that can be beneficial in lots of different ways, for example you can run a gui web<br>
        browser inside a docker container or even play games and lots of other cool stuff, but by far docker is used mostly for CI/CD pipelines<br>
        (continuous integration, deployment), developing application in microservices architecture and isolated development environments.
    </p>

<h1>commands</h1>

<ul>
    <li>docker pull "image-name" </li>
    <p>
        fetch an docker image from docker hub to your machine, so it can be used to instantiate containers.
    </p>
    <li>docker image list or docker images</li>
    <p>
        list available docker images in your machine.
    </p>
    <li>docker run</li>
<ul>