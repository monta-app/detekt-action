### Detekt Action

Centralized storing and running our [Detekt](https://github.com/detekt/detekt) workflow, this is also where we are
centralizing our configuration of Detekt

### How to use

Add this step to your `pull_request.yml` inside of your github workflows with the following block

```yaml
  static-code-analysis:
    name: Static Code Analysis
    runs-on: ubuntu-latest
    timeout-minutes: 30
    steps:
      - name: Run detekt
        uses: monta-app/detekt-action@main
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

#### Using a custom configuration file

You can optionally provide your own detekt.yml configuration file instead of using the centralized one:

```yaml
  static-code-analysis:
    name: Static Code Analysis
    runs-on: ubuntu-latest
    timeout-minutes: 30
    steps:
      - name: Run detekt
        uses: monta-app/detekt-action@main
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          detekt-config-file: ./path/to/your/detekt.yml
```

#### Input Parameters

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `github-token` | GitHub token used for generating releases | Yes | - |
| `detekt-config-file` | Path to custom detekt.yml config file | No | Uses centralized config |

#### Local Usage

1. Build Dockerfile
  
    ```bash
    docker build -t monta-detekt:latest -f Dockerfile.monta-detekt .
    ```
2. Run `monta-detekt:latest` on your repo with:
    ```bash
    # cd into your repo
    docker run --rm -v $PWD:/app monta-detekt:latest
    ```