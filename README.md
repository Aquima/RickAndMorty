# RickAndMorty App Challenge

### Story: Customer requests to see their info about Ryck And Morty TV Serie

### Narrative #1

```
The customer has requested an app that allows them to review every single
character from the popular TV show Rick and Morty. The customer has provided
a web URL https://rickandmortyapi.com/ that offers all the information they need.
The MVP of the app should allow the user to review a list of all characters
and retrieve information about the selected character. 
```

#### The following are the acceptance criteria:

```
- Any third-party libraries can be used, but wisely, as each library added is a
  dependency in the code.
- The project should be structured in such a way that it showcases the implementation
  of things like SOLID. The app will be used to discuss actual code.
- The company is image-oriented, and UX is essential.
- Endpoints from https://rickandmortyapi.com/ can be used, and performance
  will be discussed.
- The app should shine in some aspect. If the candidate's strengths are in the code,
  most of the time will be spent discussing the code.
- If the candidate has another app developed which can be checked, it can be sent
  for review using the same criteria.
```

### Narrative #2

```
Extra
```

#### For the extra criteria, the following are required:

```
- Be creative!
- Use SwiftUI.
- Cache images coming from the network to improve performance.
- Implement error handling and response caching.
- Implement tests.
- Allow for filtering and searching.
```

# RickAndMorty iOS
#### In this project, the best practices followed include:
- Using SwiftGen to generate resources.
- Performing Swift syntax linting using SwiftLint.
- Implementing the MVVM pattern architecture.
- Performing asynchronous calls using Combine.
- Implementing the network layer by creating an HttpClient object with its custom
  properties and unit test.
- Using `commit atomic` to push progress to the repository.
- Using ViewInspector to perform unit tests for view classes.
  
# Environments Requirement:
- Xcode 15.0
