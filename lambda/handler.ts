export const handler = async(event: Event) => {
    console.log(JSON.stringify(event))
    console.log('Lambda Running!')
    return 'Lambda Ran Successfully!'
}