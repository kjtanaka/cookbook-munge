munge Cookbook
==============
Installs [munge](https://code.google.com/p/munge/) from package and sets up munge key.


Requirements
------------

#### Cookbook
cookbook `yum-epel` is a dependency.

#### Platforms

The following platforms are supported and tested under test kitchen:

- CentOS 5.10
- CentOS 6.5

Usage
-----

#### munge::default

* Generate random text for `munge_key`:

```bash
openssl rand -base64 512 | tr -d '\r\n'
```

* Create a data bag `munge` and an item `secrets` and add your `munge_key`:

```json
{
  "id": "secrets",
  "munge_key": "y6ODGVRFr2mkhQpxv6HBMXk7nxNhZfJ3Y...."
}
```

* Include `munge` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[munge]"
  ]
}
```

License & Authors
-------------------
- Author:: Koji Tanaka (<kj.tanaka@gmail.com>)

```text
Copyright 2014, FutureGrid, Indiana Univercity

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
