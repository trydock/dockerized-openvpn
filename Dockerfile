FROM ubuntu:bionic

RUN apt-get update && apt-get install -y firefox \
  curl sudo openvpn transmission \
  openssh-client openssh-server netcat \
  && rm -rf /var/lib/apt/lists/*

# Environment Variables
ENV EXECUID 1000
ENV EXECGID 1000
ENV EXECUSER anish

RUN export uid=$EXECUID gid=$EXECGID user=$EXECUSER && \
    mkdir -p /home/${user} && \
    echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} && \
    chmod 0440 /etc/sudoers.d/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER $EXECUSER

RUN mkdir -p /tmp/user.js.d/
COPY files/user.js.d/* /tmp/user.js.d/
RUN cat /tmp/user.js.d/* > /home/$EXECUSER/user.js
COPY files/start.sh /home/$EXECUSER/
COPY files/start-openvpn-blocking.sh /home/$EXECUSER/

ENV HOME /home/$EXECUSER
ENTRYPOINT ["/bin/bash", "/home/$EXECUSER/start.sh"]
CMD ['firefox']
