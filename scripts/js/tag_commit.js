module.exports = ({github, context}) => {
    const tag_name = process.env.TAG_NAME;

    github.rest.git.createRef({
        owner: context.repo.owner,
        repo: context.repo.repo,
        ref: `refs/tags/v${tag_name}`,
        sha: context.sha
    })
}