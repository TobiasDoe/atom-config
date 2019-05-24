#  ⚛️ Atom Axios {vue.js , laravel , js}

<p align="center" ><img src="settings/axios.jpg"></p>

> laravel-> vue ->axios atom package by @code4mk

Install:
```ssh
apm install atom-axios
```

Mian Features:

  - Snippet Axios on vue


Version:

  - axios 0.1.0


## Snippet list
|Snippet short| Description|
|----|-----------|
| ax-g | axios get all components |
| ax-gp | axios get with params |
| ax-mg | axios multiple get |
| ax-p | axios post all components |
| ax-get | axios only get |
| ax-then | axios only then |
| ax-catch | axios only catch |
| ax-bind | `this` issue solve by bind |

# ax-g

```js
axios.get('/user?ID=12345')
  .then(function (response){
    // Getting Data from response
  })
  .catch(function (error){
    console.log(error);
  });
```

# ax-gp

```js
axios.get('/user',{
  params:{
    ID: 12345
  }
})
  .then(function (response){
   //Getting data from response
  })
  .catch( function (error){
    console.log(error);
  });
```

# ax-mg

```js
function getUserAccount() {
  return axios.get('/user/12345');
}

function getUserPermissions() {
  return axios.get('/user/12345/permissions');
}

axios.all([getUserAccount(), getUserPermissions()])
  .then(axios.spread(function (acct, perms) {
    // Both requests are now complete
  }));
```

# ax-p

```js
axios.post('/user',{
  firstName: 'code4mk',
  lastName: 'Hello-laravel'
})
  .then(function (response){
   //Getting data from response
  })
  .catch( function (error){
    // Describe error!
  });
```

# issue if can't access by `this` . follow this

```js
axios.get('/user?ID=12345')
  .then(function (response){
    // Getting Data from response
  }.bind(this))
  .catch(function (error){
    console.log(error);
  });
```


### Axios

* [Axios](https://github.com/mzabriskie/axios)

---
> [@code4mk](https://twitter.com/code4mk) // ~  [Hello Laravel](https://twitter.com/hellolaravelbd)
