resource "kubectl_manifest" "app_guestbook" {
  yaml_body = <<-EOF
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
        name: guestbook
        namespace: argo-cd
    spec:
        project: default
        source:
            repoURL: https://github.com/argoproj/argocd-example-apps.git
            targetRevision: HEAD
            path: guestbook
        destination:
            server: https://kubernetes.default.svc
            namespace: myapp
    EOF

}