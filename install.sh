if command -v pandoc 2>/dev/null; then
  echo 'Pandoc already installed'
else
  curl -fLo /tmp/pandoc-2.2-1-amd64.deb https://github.com/jgm/pandoc/releases/download/2.2/pandoc-2.2-1-amd64.deb \
    && sudo dpkg -i /tmp/pandoc-2.2-1-amd64.deb \
    && rm /tmp/pandoc-2.2-1-amd64.deb
fi
sudo apt-get -y install texlive-xetex
sudo apt-get -y install texlive-math-extra
sudo apt-get -y install texlive-fonts-recommended
sudo apt-get -y install texlive-fonts-extra
sudo apt-get -y install texlive-latex-extra
