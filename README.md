# http_upload_bug

== README

Ruby version: 2.2.3

This repo is for reproducing an error "IOError: uninitialized stream" when passing HTTP Uploaded Files to a model in serialized params.
The error happens in Rails 4.2, but works in 4.1

To reproduce the error:
1. Uncomment the corresponding Rails version
2. run `bundle update && rake test`

The test will pass on 4.1 but fail with "IOError: uninitialized stream" on 4.2.

I suspect it has to do with the way the serialize works now, it rebuilds the class but does not initialize the file stream correctly.
Using `File.open(file_from_params.tempfile.path).read` works.

It may not be necessary to fix the error. Passing http uploaded files into a serialized hash is probably a bad thing - in my case users can upload files into template fields, so I convert the files into identifiers in a before_save (only want to do the uploads if validation succeeds).
