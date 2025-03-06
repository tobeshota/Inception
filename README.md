# Inception

**Inception is one of the [42](https://42tokyo.jp/) projects.**  
**It is a System Administration related exercise by using Docker.**

WordPress: https://toshota.42.fr/  
login: https://toshota.42.fr/wp-login.php

---
Architecture diagram:
```mermaid
graph TD;
	subgraph Computer HOST
		www[<i class="fa fa-globe"></i><br>www]<--443(port)-->c_nginx[Container<br>NGINX]
		subgraph Docker network
			c_nginx<--9000(port)-->c_wp_php[Container<br>WordPress + PHP]<--3306(port)-->c_db[Container<br>DB]
		end
		c_db<--(Link network)-->db(DB)
		c_nginx<--(Link network)-->word_press(WordPress)<--(Link network)-->c_wp_php
	end

	%% Color specification
	class www brightyellow;
	class db,word_press,volume lightgreen;
	class c_nginx,c_wp_php,c_db,image_docker lightblue;

	%% Color settings
	classDef brightyellow fill:#FFFF00,stroke:#003366,stroke-width:2px;
	classDef lightgreen fill:#00FF00,stroke:#003366,stroke-width:2px;
	classDef lightblue fill:#00FFFF,stroke:#003366,stroke-width:2px;
```

```mermaid
graph TD;
	image_docker[image docker]
	volume(volume)

	%% Color specification
	class volume lightgreen;
	class image_docker lightblue;

	%% Color settings
	classDef lightgreen fill:#00FF00,stroke:#003366,stroke-width:2px;
	classDef lightblue fill:#00FFFF,stroke:#003366,stroke-width:2px;
```
