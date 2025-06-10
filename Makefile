# Set your GHCR repo URL (update your username/org accordingly)
ghcrRepoUrl := oci://ghcr.io/cloudcatalysttech

# Package the Helm chart
package:
	helm package .

# Publish to GitHub Container Registry
.PHONY: publish
publish: package
	echo "$$GHCR_TOKEN" | helm registry login ghcr.io \
		--username haydercyber \
		--password-stdin && \
	helm push "`ls HelmHarbor-*.tgz`" $(ghcrRepoUrl)

# Clean the packaged chart
.PHONY: clean
clean:
	rm -f HelmHarbor-*.tgz
