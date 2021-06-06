FROM windows:20H2 as builder

## Install python + dependencies
RUN apt update -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget software-properties-common python3.8
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

# esma3ni ab3ethli l projet l kol,
# I need to go, I will update you ok i will

#Installing Android SDK
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/user/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/user/Android/sdk/platform-tools"

#Installing Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/user/flutter/bin"
RUN flutter channel dev
RUN flutter upgrade
RUN flutter doctor

#Get the project files from github
RUN git clone https://github.com/aymenBox/FlutterTest.git
# RUN cd FlutterTest && flutter build apk --debug
