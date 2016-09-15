# seene-shelter

## Idea

One-page Web 2.0 project without with Flickr for backend and social part (followers, comments, likes).

Original JavaScript viewer with small changes can be used to show content.

## Progress

| What                           | Status  | Notes                                        |
| -------------------------------|---------|----------------------------------------------|
| Design the web app             | TODO    |
| Viewer to work separately      | DONE    | http://seene-shelter.github.io/viewer/#/?url=https://farm9.staticflickr.com/8447/28629663783_9d20b4120d_o_d.jpg
| Viewer to accept export format | DONE    |
| Implement the web app          | 10%     | in progress
| Get good domain name           | DONE    | github.io can host stuff for now, no need to pay or register |
| Host the web app               | DONE    | http://seene-shelter.github.io/              |
| Dropbox API                    | DONE    | [investigations, abandoned, see Flickr instead](t/dropbox/readme.md), [test](http://seene-shelter.github.io/t/dropbox/)                       |
| Flickr API                     | 20%    | [test](https://seene-shelter.github.io/feed-testing-prototype.html)                |

## Design outline

Useful hint: "seene://capture" opens Seene app in capture mode (if it was open before; if not -- just opens the app)

User opens http://seene-shelter.github.io/

First time: presented with a dialogue, requesting permission to see his feed.
Then: sees a feed of stuff from people she follows, can like/comment (for now by going to Flickr site/mobile app).

## Viewer options

* original viewer, patched to support JPG+XMP (DONE)
* https://www.clicktorelease.com/code/depth-player/ (already supportes JPG+XMP)
* new, based on same three.js
* http://depthy.me (uses self-created 3d library pixi.js, and tricky webgl filtering -- potentially best for battery)

## Storage options

### Flickr (going for this)
 
* sufficiently well-known, people might already have an account there
* 1TB free storage
* good collaboration inside, followers, favorites
* albums and groups 
* fantastic API, with comments and likes

#### Plan and some tests

* all strictly public, no actual Flickr password is required
* initially as user to specify her flickr photostream URL (https://www.flickr.com/photos/thispaf/)
* call https://www.flickr.com/services/api/flickr.urls.lookupUser.htm and resolve it to user_id (143913318@N02)
* remember user_id in cookie (present some way to logout)
* call https://www.flickr.com/services/api/flickr.photos.getContactsPublicPhotos.htm with user_id, count=500, include_self=true,
* sample output
```
{ "photos": { 
    "photo": [
      { "id": "29666745355", "secret": "6ab1d1327b", "server": "8067", "farm": 9, "owner": "44653378@N00", "username": "johndhodson", "title": " ", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
      { "id": "29555680632", "secret": "abb4534890", "server": "8096", "farm": 9, "owner": "44653378@N00", "username": "johndhodson", "title": " ", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
      { "id": "29590490226", "secret": "fd52a9a8d4", "server": "8595", "farm": 9, "owner": "44653378@N00", "username": "johndhodson", "title": "MotoBrigade Cap", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
      { "id": "28963335904", "secret": "37ff50e3e1", "server": "8248", "farm": 9, "owner": "144757151@N05", "username": "Jill Akhgar", "title": " ", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
      { "id": "28965333633", "secret": "690b8a26cd", "server": "8441", "farm": 9, "owner": "144757151@N05", "username": "Jill Akhgar", "title": " ", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
```
* https://www.flickr.com/photos/{$owner}/{$id} (photo page)
* https://farm{$farm}.static.flickr.com/{$server}/{$id}_{$secret}.jpg (500x500)
* TODO (original)
* samples
* https://www.flickr.com/photos/44653378@N00/29666745355 (photo page)
* https://farm9.static.flickr.com/8067/29666745355_6ab1d1327b.jpg  (500x500)
* https://c1.staticflickr.com/9/8067/29666745355_01e6da512c_o.jpg  (original)
* useful $title
* TODO: showhow filter this to only Seenes (exclude other stuff)

### Dropbox

* sufficiently well-known, people might already have an account there
* free account of 2Gb is enough for about 2K of Seenes, older stuff can be removed or moved to separate account
* has good API
* has public links; https://www.dropbox.com/sh/1h3zy9jm4nftelm/AABAdhug5I_8NO8z5-N1lpVOa
* has comments on public links web and in mobile app (one need Dropbox account to write a comment)
* has convenient ways of uploading from mobile device (including auto-upload)

### Others

* Twitter (no; strips depth)
* Tumblr (no; strips depth)
* Google Photo (no; strips depth)
* Google Drive (no; no comments on public links; exif OK; generates thumbnails, has commends and star APIs) https://drive.google.com/drive/folders/0B8GthpIZqpZrdGtXbU1wTl9BT0E?usp=sharing
* Yandex Disk (no; no comments on public photos, only on folder itself; exif OK; generates thumbnails, has English interface; has app; integrated with Yandex Photos) http://yadi.sk/d/qxKZvTyRuKaVC
* Microsoft OneDrive (no; no comments on public links) https://1drv.ms/f/s!AuF-koJa9h5LgQp3aB5vemXNd1dE
* https://Box.com (no; no comments on public links) https://app.box.com/s/sql7s997mhogwbjufss4wd2in6ro05my
* https://iCloud.com (no; no public links and no comments)
* https://mega.nz (no; no iOS app; not investigated further)
* https://cloud.mail.ru/ (no; no comments at all; no documented API (hacks present); 15Gb)
* http://www.opendrive.com/ (no; no comments)
