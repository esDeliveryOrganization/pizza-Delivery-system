# 📰  Api Quotes  📰
> Status: **Finalizado**✅<br>

## Sobre o projeto 📑
Projeto proposto pela [Inova Mind](https://inovamind.com.br) com o objetivo de testar minhas habilidades. O projeto é uma Api que faz um web Crawler de um [Quotes to Scrape](http://quotes.toscrape.com) e retorna as informações da frase.

## Objetivo ✅
O objetivo principal da Api é buscar e armazenar em cache as frases. Retorna as informações de cada frase em formato Json. Ele tanto retorna as informações diretamente do site, como também armazena em cache caso a busca já tenha sido feita anteriormente. Essas buscas são feitas através de parâmetros indicados na URL. Atualmente existem 2 buscas(endpoints) na api: buscar pela *tag* e pelo *author*

## Implementação 👦
A Frase se divide em *texto da frase*, *autor*, *link de perfil do autor* e as *tags* que referenciam a frase. Esse model foi dividido em dois: frase e tag. Para fazer a junção dos dois com o relacionamento de muitos pra muitos foi usado o has_many_through:

![image](https://user-images.githubusercontent.com/55983920/146430609-266d42ec-b54e-4b3b-85ad-514410af1b27.png)

![image](https://user-images.githubusercontent.com/55983920/146430792-3e443cce-1553-43c7-8c01-be25bd5e6a2c.png)

![image](https://user-images.githubusercontent.com/55983920/146430646-e3425428-a1d2-4ac3-bda4-28a48c751082.png)

Para obter as informações das frases, foi feito o web crawler da página [Quotes to Scrape](http://quotes.toscrape.com), utilizando a gem [Nokogiri](https://rubygems.org/gems/nokogiri/versions/1.6.8?locale=pt-BR).

O armazanamento em cache se comporta de duas forma: se a tag *não foi* pesquida ainda, ela é salva no banco com o atributo 'pesquisada' marcado como verdadeiro
, isso faz com que não seja mais preciso voltar no site e 'minerar' as informações.
Como cada frase pode ter várias tags, essas tags secundárias são salvas, mas marcadas como 'não'
