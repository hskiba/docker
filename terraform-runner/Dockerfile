FROM centos:latest

# Install tools
RUN dnf update -y
RUN dnf install -y wget zsh git vim

# Install ohmyzsh
RUN dnf install -y glibc-langpack-en
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN dnf install -y util-linux-user
RUN chsh -s /bin/zsh root
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname --m).zip" -o "awscliv2.zip"
RUN dnf install -y unzip
RUN unzip awscliv2.zip
RUN rm awscliv2.zip
RUN ./aws/install
RUN aws --version

# Install Terraform
RUN if [[ $(uname -m) == aarch64 ]]; then \
   GOARCH=arm64; \
   else \
   GOARCH=amd64; \
   fi && \
   wget https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_$GOARCH.zip && \
   unzip terraform_0.15.5_linux_$GOARCH.zip && \
   rm terraform_0.15.5_linux_$GOARCH.zip

RUN mv terraform /usr/local/bin

CMD ["/bin/zsh"]''