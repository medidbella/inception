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
        to run on any target system and avoid the <strong>"it runs on my machine"</strong> problem.<br>
    </p>

<h3>docker images</h3>
    <p>
        a docker image is a readonly template that packages all the libraries and system dependencies needed to run a certain software,<br>
        another to look at it is a blueprint or a snapshot to run containers since the docker engine initializes container from docker images<br>
        and the docker image does not change after initializing a container from it.<br>
    </p>

<h3>why use docker</h3>
    <p>
        docker is a very useful piece of software that can be beneficial in lots of different ways, for example you can run a gui web<br>
        browser inside a docker container or even play games and lots of other cool stuff, but by far docker is used mostly for CI/CD pipelines<br>
        (continuous integration, deployment), developing application in microservices architecture and isolated development environments.<br>
    </p>

<h1>some useful commands</h1>

<ul>
    <li><strong>$ docker pull "image-name"</strong></li>
        <p>
            fetch an docker image from docker hub to your machine, so it can be used to instantiate containers.<br>
            you can specify the source when using docker pull but docker hub is the default.<br>
        </p>
    <li><strong>$ docker image list or docker images</strong></li>
        <p>
            list available docker images in your machine.
        </p>
    <li><strong>$ docker run "image-name"</strong></li>
        <p>
            as the name suggest this is the command that will run a container from an image, flags can be added check this such as '--name "a name"'<br>
            to chose a name for it , '--rm' so the container will be deleted automatically after termination, '-it' to run a interactive tty to the <br>
            container you want to run , '--rm' so that the container will be deleted entirely from the system after termination 
        </p>
    <li><strong>$ docker ps</strong></li>
        <p>
            list all docker containers that are currently running, you can add -a to see terminated ones <br> 
        </p>
    <li><strong>$ docker start "name/id"</strong></li>
        <p>
            run an already existing container but terminated, because docker containers can be ether running or terminated so that it can keep <br>
            it's state , keep in mind that docker containers are not retrievable after being deleted using $(docker rm "name")<br>
        </p>
    <li><strong>$ docker stop "name/id"</strong></li>
        <p>
            stop a running container and keep its state know it will only be visible using docker ps with the flag -a, stopping a command usually <br>
            takes more time that starting it .<br> 
        </p>
    <li><strong>$ docker rm "name/id"</strong></li>
        <p>
            deletes a specified container Not the image but the actual container, to delete a container it must be stopped first.<br>
        </p>
    <li><strong>$ docker start "name/id " ...</strong></li>
        <p>
            re launches one or more stopped containers in the background.
        </p>
    <li><strong>$ docker exec "name/id" command</strong></li>
        <p>
            executes the given command in a running container, can be used for example after docker start to access a the running container <br>
            with an interactive shell here is the syntax:<br>
                $-> docker exec -it 'container' bash 
        </p>
<ul>