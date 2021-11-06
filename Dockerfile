FROM python:3.8.12-buster

RUN pip3  install --upgrade pip
RUN pip3 install torch==1.10.0+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html
RUN pip3 install uvicorn===0.15.0 fastapi==0.70.0 uvloop==0.16.0 httptools==0.3.0 pytorch-lightning==1.5.0
RUN pip3 install pandas==1.3.4 pytest
COPY . wml

WORKDIR wml

RUN pip3 install .

CMD uvicorn windml.app:app --reload --host 0.0.0.0
