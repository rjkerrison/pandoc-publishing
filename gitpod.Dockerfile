FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN curl -fLo /tmp/pandoc-2.2-1-amd64.deb https://github.com/jgm/pandoc/releases/download/2.2/pandoc-2.2-1-amd64.deb \
    && sudo dpkg -i /tmp/pandoc-2.2-1-amd64.deb \
    && rm /tmp/pandoc-2.2-1-amd64.deb

RUN apt-get install texlive-latex-base
RUN apt-get install texlive-fonts-recommended
RUN apt-get install texlive-fonts-extra
RUN apt-get install texlive-latex-extra

USER gitpod
# Apply user-specific settings
# ENV ...

# Give back control
USER root
