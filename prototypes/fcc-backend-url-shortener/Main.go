package main

import (
	"fcc-backend-url-shortener/handler"
	"net/http"
)

func main(){
	http.HandleFunc("/api/shorturl/", handler.RedirectHandler)
	http.HandleFunc("/api/shorturl", handler.ShortenerHandler)
	http.ListenAndServe(":8080", nil)
}



//curl -X POST http://localhost:8080/api/shorturl -H "Content-Type: application/json"  -d '{"url":"https://google.com"}'

//curl -X POST http://localhost:8080/api/shorturl -H "Content-Type: application/json"  -d '{"url":"hdafsddfam"}'

//curl -X POST http://localhost:8080/api/shorturl/kPc74A -H "Content-Type: application/json"  -d '{"url":"https://google.com"}'


//http.Redirect(w, r, url, http.StatusPermanentRedirect)