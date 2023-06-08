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