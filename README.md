<h1>terminology</h1>
    
<h3><strong>docker ?</strong></h3>
<p>
    Docker is an open source containerization tool that manages isolated environments (containers).<br>
    Containers include all the tools and dependencies needed to run specific software.<br>
    The key difference between containerization and virtualization is that containers are lightweight and much faster to run than virtual machines.<br>
    Virtual machines require hardware virtualization (RAM, CPU, STORAGE, etc.) and a separate OS via a hypervisor.<br>
    Docker engine uses OS-level virtualization, sharing the host kernel to run and manage containers in isolation.<br>
</p>

<h3>container</h3>
<p>
    A container is an isolated running environment instantiated from an image by the Docker engine.<br>
    It can be started, stopped, and deleted. Developers use containers to package software and dependencies<br>
    to run on any target system and avoid the <strong>"it runs on my machine"</strong> problem.<br>
</p>

<h3>docker images</h3>
<p>
    A Docker image is a read-only template that packages all libraries and system dependencies needed to run specific software.<br>
    Think of it as a blueprint or snapshot for containers, since the Docker engine initializes containers from images.<br>
    The image does not change after a container is created from it.<br>
</p>

<h3>why use docker</h3>
<p>
    Docker is mainly used by development teams to share consistent development environments.<br>
    All team members can share a Dockerfile that defines standard dependencies and packages.<br>
    This file is used to build images and then containers, ensuring new features work for everyone.<br>
    Docker is also popular for developing applications with microservices architecture, as each service can run in its own independent container.<br>
</p>

<h1>some useful commands</h1>
<ul>
    <li><strong>$ docker pull "image-name"</strong></li>
    <p>
        Fetch a Docker image from Docker Hub to your machine for container instantiation.<br>
        You can specify the source, but Docker Hub is the default.<br>
    </p>
    <li><strong>$ docker image list</strong> or <strong>docker images</strong></li>
    <p>
        List available Docker images on your machine.
    </p>
    <li><strong>$ docker run "image-name"</strong></li>
    <p>
        Run a container from an image. Flags like <code>--name "desired-name"</code>, <code>--rm</code>, and <code>-it</code> can be added.<br>
    </p>
    <li><strong>$ docker ps</strong></li>
    <p>
        List all running Docker containers. Add <code>-a</code> to see stopped ones.<br>
    </p>
    <li><strong>$ docker start "name/id"</strong></li>
    <p>
        Start an existing stopped container. Deleted containers cannot be retrieved.<br>
    </p>
    <li><strong>$ docker stop "name/id"</strong></li>
    <p>
        Gracefully stop a running container and keep its state. It will be visible with <code>docker ps -a</code>.<br>
    </p>
    <li><strong>$ docker kill "name/id"</strong></li>
    <p>
        Immediately and forcefully stop a running container. Use only as a last resort, as it may cause data loss.<br>
    </p>
    <li><strong>$ docker rm "name/id"</strong></li>
    <p>
        Delete a specified container (not the image). The container must be stopped first.<br>
    </p>
    <li><strong>$ docker exec "name/id" 'a command'</strong></li>
    <p>
        Execute a command in a running container. For example, <code>$ docker exec -it container bash</code> opens an interactive shell.<br>
    </p>
    <li><strong>$ docker attach "name/id"</strong></li>
    <p>
        Attach your terminal to a running container. Closing the terminal gracefully stops the container.<br>
    </p>
</ul>

<h1>writing docker files</h1>
<p>
    A Dockerfile is a plain text file that Docker uses to build container images.<br>
    The syntax is: <code>INSTRUCTION argument</code>.<br>
    Each instruction creates a read-only layer in the image. Layers are cached and reused by Docker.<br>
    Docker assigns a unique hash to each layer change and checks for cached layers when building images.<br>
    If a match is found, Docker reuses the cached layer; otherwise, it creates a new one.<br>
</p>

<h2>common docker file instructions</h2>
<ul>
    <li><strong>FROM &lt;base image&gt;:</strong></li>
    <p>
        this is a mandatory instruction that must be set before any other one, it is used to specify<br>
        which base image will be used to create your new image, it is fetched from an image registry<br>
        docker hub by default you may have a 'chicken and egg question' in mind and ask if each i want to<br>
        make my image i should always use FROM to fetch a base image how did the first image was created ?<br>
        the answer is that The process for creating a foundational base image like debian, or alpine<br>
        is a manual they compress the minimal filesystem from the OS as a tar file and use it as the pulled base<br> 
        image, you can also use FROM scratch so you will not use any image as your starting point, and then copy<br>
        the file system tar to your image directly.<br>
    </p>
    <li><strong>RUN &lt;command:&gt; args...</strong></li>
    <p>
        is used to run a programs that are needed or just desired to be<br>
        executed while creating the image, it can be used in two different ways :<br>
        1. RUN <command> [arg1] [...] in this case the dockerd will relay on the default<br>
          base image shell to run the command.<br>
        2. RUN ["bin path", "arg1", ...] in this case dockerd will execute the command<br>
          directly without relaying on the shell.<br>
    </p>
    <li><strong>CMD &lt;command:&gt;[args...]</strong></li>
    <p>
        is a way of specifying a default command that will<br>
        be used by the container, which means it will be be the PID 1 for the container<br>
        and if it exits the container itself will stop, this command will usually be set<br>
        to a long running command such as a shell or a web server, whats important to<br>
        know is that this instruction doesn't have anything to do with the image creation<br>
        so it will not add a new layer but only be used a starting point when a container<br>
        is started form the image, this command can be overridden when using docker run<br>
        keep in mind that if ENTRYPOINT is used the CMD value will only be used as params<br>
        for the command specified in the ENTRYPOINT<br>
    </p>
    <li><strong>ENTRYPOINT &lt;command:&gt;[args...]</strong></li>
    <p>
        is similar to CMD except that it can not be<br>
        overridden when using docker exec and the provided argument will be used as a pram<br>
        for the specified command in the entry point , if both ENTRYPOINT and CMD are used<br>
        CMD value will be used as extra arguments for the ENTRYPOINT command<br>
    </p>
</ul>
