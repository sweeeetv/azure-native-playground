//http logic

package handler

import (
	"encoding/json" //handles json data, converts/translates Go structs/maps - JSON.
	"fcc-backend-url-shortener/store"
	"fcc-backend-url-shortener/utils"
	"net/http" //starts server, define routes, read incoming req, send res.
	"net/url"
)

//define a struct, so it can work with req.URL
type Req struct {
	URL string `json:"url"` 
	//URL must be all cap to export, or its private. Go won’t allow encoding/decoding (important)
	//`json:"url"`  -> struct tag, a mapping rule for json. -> “When reading JSON, look for a field called url and map it to URL” 
	//
}

func ShortenerHandler(w http.ResponseWriter, r *http.Request){
	var req Req
	var shortUrl string
	//take json from the r.body, and turn it into a Go struct.
	//json.NewDecoder(r.Body) -> creates json decoder and reads from that stream. reads directly from the req
	////.Decode(&req) -> write the JSON into Req struct, &req -> & needed so Go would update the actual struct.
	err := json.NewDecoder(r.Body).Decode(&req) 
	if err != nil { 
		http.Error(w, "invalid url", http.StatusBadRequest)
		return
	}
	_, err = url.ParseRequestURI(req.URL)
	if err != nil {
		http.Error(w, "invalid url", http.StatusBadRequest)
		return
	}

	shortUrl = utils.GenerateShortUrl(6)
	store.Save(shortUrl, req.URL)
	w.Header().Set("Content-Type", "application/json")
	response := map[string]string{
		"original_url": req.URL,
		"short_url": shortUrl,
	}
	json.NewEncoder(w).Encode(response)

}

func RedirectHandler(w http.ResponseWriter, r *http.Request){
	shortUrl := r.URL.Path[14:] // /abc123 -> abc123
	longUrl, exists := store.Get(shortUrl)
	if !exists {
		http.Error(w, shortUrl + " not found", http.StatusNotFound)
		return
	}
	http.Redirect(w, r, longUrl, http.StatusPermanentRedirect)
}

