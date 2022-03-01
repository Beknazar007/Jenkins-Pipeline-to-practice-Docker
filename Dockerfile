FROM python:3.7-alpine

RUN pip install request

COPY hello.py /


CMD ["python", "hello.py"]