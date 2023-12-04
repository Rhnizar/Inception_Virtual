### How Docker and docker compose work
## Docker :
	is a tool designed to make it easier to create, deploy, and run applications by using `containers`.
	so it will always work the same regardless of its environement
# What is Containers :
	Containers are like little packages that have everything a program needs to run.
	it makes it easy to move the code to different computers.
	Each container runs as an isolated process in the user space and take up less space than regular VM
	due to their layered architecture.
# How Docker work :
	Docker packages an application and all it dependencies in  virtual container that can run on any linux-server.
	☑️ At a high level, Docker works by using a technology called 𝙘𝙤𝙣𝙩𝙖𝙞𝙣𝙚𝙧𝙞𝙨𝙖𝙩𝙞𝙤𝙣.

# The Goal of Docker container :
	your code will work everywhere .

## Docker Compose :
	 is a tool for defining and managing multi-container applications. It uses a simple YAML file (docker-compose.yml) to specify services, networks, and volumes, allowing for the easy orchestration of interconnected containers. With Docker Compose, developers can streamline application deployment and management by specifying configurations, dependencies, and network connectivity in a single file.

# How Docker Compose work :
	𝗗𝗼𝗰𝗸𝗲𝗿 𝗖𝗼𝗺𝗽𝗼𝘀𝗲
	☑️ A tool for 𝙙𝙚𝙛𝙞𝙣𝙞𝙣𝙜 𝙖𝙣𝙙 𝙧𝙪𝙣𝙣𝙞𝙣𝙜 𝙢𝙪𝙡𝙩𝙞-𝙘𝙤𝙣𝙩𝙖𝙞𝙣𝙚𝙧 𝘿𝙤𝙘𝙠𝙚𝙧 applications.
	☑️ With Compose, 𝙮𝙤𝙪 𝙪𝙨𝙚 𝙖 𝙔𝘼𝙈𝙇 𝙛𝙞𝙡𝙚 to define the services, networks, and volumes, and then start all services with a single command.

	https://iris1919.hashnode.dev/day18-docker-compose-yaml-for-devops-engineers

### The difference between a Docker image used with docker compose and without docker compose
## Without Docker Compose:
1. Single Container:
	When you use Docker without Compose, you typically work with a single container at a time. You use commands like docker run to start and manage individual containers.

2. Manual Configuration:
	You need to specify all the configuration options and settings for the container directly in the docker run command or in a Dockerfile. This can lead to longer and more complex command lines or Dockerfiles.

3. Limited Orchestration:
	Without Docker Compose, orchestrating multiple containers and managing their dependencies becomes more manual. You may need to start and link containers individually, manage networks manually, and handle environment variables on your own.

## With Docker Compose:
1. Multi-container Environments:
	Docker Compose is designed for defining and managing multi-container Docker applications. You can specify multiple services (containers) in a single docker-compose.yml file, allowing you to define complex application architectures.

2. Declarative Configuration:
	Docker Compose uses a declarative YAML configuration file (docker-compose.yml) where you specify the services, networks, volumes, and other settings for your application. This makes it easier to understand and manage the overall configuration.

3. Simplified Orchestration:
	With Docker Compose, you can use a single command (docker-compose up) to start the entire multi-container environment defined in your docker-compose.yml file. Docker Compose takes care of creating networks, linking containers, and managing dependencies.

4. Environment Variables and Networking:
	Docker Compose provides built-in support for defining environment variables, specifying network configurations, and linking services together. This makes it simpler to manage communication between containers and pass configuration information.

### What do hosts and containers have in common?
	Hosts and containers share the same kernel.
	In the context of containerization, such as with technologies like Docker, the kernel is a critical component that is shared between the host operating system and the containers.
	A container is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including the code, runtime, libraries, and system tools. Containers share the host operating system's kernel but run in isolated user spaces. This sharing of the kernel allows containers to be more resource-efficient and faster than traditional virtual machines.
	In contrast, virtual machines (VMs) operate with a complete operating system stack, including a separate kernel for each VM. This can make VMs heavier in terms of resource usage compared to containers.
	So, the kernel is a fundamental piece that facilitates the communication and interaction between the host and the containers, enabling them to operate efficiently and in an isolated manner.

### The benefit of Docker compared to VMs

1. Resource Efficiency:
	# Docker:
		Docker containers share the host system's kernel, making them more lightweight than VMs. Containers don't require a full operating system to run; they only need the runtime and libraries necessary for the application. This results in faster startup times and more efficient use of system resources.
	# VMs:
		Each VM runs its own operating system, which consumes more resources. VMs require a hypervisor to manage and emulate multiple virtual machines on a host system. This can lead to higher resource overhead compared to containers.

2. Isolation:
	# Docker:
		Containers provide process isolation, meaning each container runs in its own user space, separate from the host and other containers. While containers share the host OS kernel, they encapsulate the application and its dependencies, providing a level of isolation.
	# VMs:
		VMs offer stronger isolation because each VM has its own complete operating system, providing a more secure separation between VMs. However, this also means VMs are heavier in terms of resource usage.

3. Scalability:
	# Docker:
		Docker's lightweight nature allows for rapid scaling. It's easier to spin up multiple instances of containers, and they can start quickly.
	# VMs:
		Starting and stopping VMs typically takes more time compared to containers. The additional overhead of booting a full operating system can slow down the scaling process.
4. Resource Utilization:
	# Docker:
	Containers use resources more efficiently because they share the host OS kernel. This efficiency allows you to run more containers on a given host compared to running VMs.
	# VMs:
	VMs have a larger resource footprint due to the need for separate operating systems. Running multiple VMs on a host may require more resources and result in underutilization.

### Docker Volumes
	In Docker, a volume is a mechanism for persisting and sharing data between containers and the host machine. It provides a way to store and manage data separately from the container's lifecycle, allowing data to persist even if the container is stopped, restarted, or removed.
## Docker volumes vs. Bind Mounts
# Bind Mounts
	Bind mounts will mount a file or directory on to your container from your host machine, which you can then reference via its absolute path.
# Docker Volumes
	Docker volumes are completely handled by Docker itself and therefore independent of both your directory structure and the OS of the host machine. When you use a volume, a new directory is created within Docker’s storage directory on the host machine, and Docker manages that directory’s contents. Volumes are easier to back up or migrate than bind mounts.

### Docker Network
	Docker networking enables a user to link a Docker container to as many networks as he/she requires. Docker Networks are used to provide complete isolation for Docker containers
	
	Docker provides different network modes that influence the isolation between containers. Let's discuss a couple of network modes and how they contribute to isolation:
1. Bridge Network (Default):
	Connectivity: Containers on the same bridge network can communicate with each other.
	Isolation: While containers on the same bridge network can communicate, they are isolated from containers on other bridge networks by default.
2. None Network:
	Connectivity: Containers on the none network have no network interfaces, essentially isolated from the network.
	Isolation: Containers on the none network are highly isolated, having no connectivity by default.
3. Host Network:
	Connectivity: Containers share the host network stack, having full access to the host's network interfaces.
	Isolation: Containers using the host network mode have minimal network isolation; they share the same network namespace as the host.
4. Overlay Network (Swarm Mode):
	Connectivity: Containers in an overlay network can communicate with each other across multiple Docker daemon hosts.
	Isolation: While providing connectivity across hosts, containers in an overlay network are isolated from containers not connected to the same network.
5. Macvlan Network:
	Connectivity: Containers on a Macvlan network can have their own MAC addresses and appear as separate physical devices on the network.
	Isolation: Containers on a Macvlan network can be isolated like individual physical machines, but communication depends on the network configuration.
6. Custom User-Defined Bridge Networks:
	Connectivity: Containers on a user-defined bridge network can communicate with each other.
	Isolation: Containers on different user-defined bridge networks are isolated from each other. Additionally, you can control communication between containers using network policies.

Isolation Techniques:
Container Namespacing: Docker uses namespaces to provide isolation, including network namespaces. Each container gets its own network namespace, ensuring separation.
IP Addressing: Containers on the same network typically get their own IP addresses, contributing to network isolation.
Port Mapping: You can control which ports are exposed and mapped to the host, providing a level of isolation for container services.
In summary, Docker provides various network modes and features that allow you to control the level of isolation between containers. The default bridge network provides some isolation, and custom user-defined bridge networks offer more control. The choice of network mode depends on your specific use case and isolation requirements.

### cgroups && namespaces
## Are Namespaces and cgroups are responsible for isolation ?
	Yes, Namespaces and cgroups are responsible for isolation .

# What are namespaces?
	Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources. The feature works by having the same namespace for a set of resources and processes, but those namespaces refer to distinct resources. Resources may exist in multiple spaces.
	Examples of such resources are process IDs, hostnames, user IDs, file names, and some names associated with network access, and interprocess communication.

# What are cgroups?
	A control group (cgroup) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, and so on) of a collection of processes.
	basically you use cgroups to control how much of a given key resource (CPU, memory, and disk I/O) can be accessed or used by a process or set of processes. Cgroups are a key component of containers because there are often multiple processes running in a container that you need to control together.

## Conclusion the cgroups and namespaces
	Namespaces and cgroups are the building blocks for containers and modern applications. Having an understanding of how they work is important as we refactor applications to more modern architectures.
	Namespaces provide isolation of system resources, and cgroups allow for fine‑grained control and enforcement of limits for those resources.


