# Deploy Phoenix App on Kubernetes

Can deploy this app on Digital Ocean Managed Kuberenetes. Apply for \$100 credit with Digital Ocean using [this link](https://m.do.co/c/b880985e5d50)

## Image Build

Build image with:
```bash
docker build -t tag-name .
```

## Setup K8s Service
```bash
kubectl apply -f k8s.yml
```

## Reference Video

[https://youtu.be/muAOqqXSTv8](https://youtu.be/muAOqqXSTv8)