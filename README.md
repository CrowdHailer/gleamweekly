# [Gleam Weekly](https://gleamweekly.com/)

Handpicked articles and community news delivered to your inbox in one weekly email.

## `/mailer`

Script to build archive of issues and current email content.

```
(cd mailer; gleam run -m gleamweekly preview)
```

The output of this command is committed, see `email.html` and `website/issues`.
This output is used as the test suite. Any changes in output as a result of changing the build tooling can be checked by looking at the effect on previous issues.

## Future improvements

Things I haven't had time to build but that would be nice.

- Social previews, so that sharing links to issues or pages so some nice content.
- RSS feed.
- Index page.
- Render latest issue on homepage.
- Date -> issue functionality.
