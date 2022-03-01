FROM python:3.7-alpine

COPY hello.py /


CMD ["python", "hello.py"]