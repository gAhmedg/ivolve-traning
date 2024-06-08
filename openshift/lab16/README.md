oc new-app nginx~https://github.com/IbrahimmAdel/html --name=my-custom-app -n ahmedgomaa









# lab 16: Source-to-Image (S2I) Workflow
## Objective
Use Source-to-Image (S2I) to build container images directly from application source code and deploy an application using the S2I workflow.

## Steps

### Create a BuildConfig Using S2I Strategy

Use the S2I process with an Nginx builder image to create a BuildConfig for the HTML application. This command tells OpenShift to create a new build configuration that will use the source code from the GitHub repository and the specified builder image to build the application.

```bash
oc new-app nginx~https://github.com/IbrahimmAdel/html.git --name=my-html-app -n <your-namespace>
```
Replace <your-namespace> with your actual OpenShift project/namespace.

### View the Build Logs and Monitor Progress

To view the build logs and monitor the progress, use the following command:

```bash
oc logs -f bc/my-html-app -n <your-namespace>
```
### Expose the Service and Access the Website

Once the build is complete, expose the service to create a route and access the website:

```bash
oc expose svc/my-html-app -n <your-namespace>
```
### Get the route to access the website:

```bash
oc get route -n <your-namespace>
```
Access the website using the URL provided by the route.