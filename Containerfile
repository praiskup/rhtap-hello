FROM registry.fedoraproject.org/fedora:40

RUN dnf install -y httpd mock && dnf clean all

RUN useradd mockbuilder && usermod -a -G mock mockbuilder

USER mockbuilder

RUN mock --shell

EXPOSE 8080

RUN sed -i 's/^Listen.*/Listen 0.0.0.0:8080/' '/etc/httpd/conf/httpd.conf'

CMD ["httpd", "-D", "FOREGROUND"]
