// data layer -> later becomes redis/table

// groups this file into a module called store.
package store

//key -> abcdef, value -> long url, both are strings
// this like a dictionary. "abc123" -> "https://google.com"
var URLStore = make(map[string]string)	//initialize the map, must do before assign value.

//Redis SET
func Save(shortUrl string, url string) {
	//core
	URLStore[shortUrl] = url
}
//this lives in memory only, data will be wiped if app stops

//Redis GET
func Get(shortUrl string) (string, bool) {
	url, exists := URLStore[shortUrl] //looks up the key/shortUrl in the map and return the value if it exists
	return url, exists
}