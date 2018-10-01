FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN curl -fLo /tmp/pandoc-2.2-1-amd64.deb https://github.com/jgm/pandoc/releases/download/2.2/pandoc-2.2-1-amd64.deb \
    && sudo dpkg -i /tmp/pandoc-2.2-1-amd64.deb \
    && rm /tmp/pandoc-2.2-1-amd64.deb \
    && apt-get install texlive-latex-base \
    && apt-get install texlive-fonts-recommended \
    && apt-get install texlive-fonts-extra \
    && apt-get install texlive-latex-extra

USER gitpod
# Apply user-specific settings
# ENV ...

# Give back control
USER root
