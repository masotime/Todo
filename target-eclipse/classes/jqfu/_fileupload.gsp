<div class="fileupload">
   <form action="${url}" method="POST" enctype="multipart/form-data">
      <div class="fileupload-buttonbar">
         <input type="hidden" name="protocol" value="http">
         <label class="fileinput-button">
            <span>Add files...</span>
            <input type="file" name="files[]" multiple>
         </label>
         <button type="submit" class="start">Start upload</button>
         <button type="reset" class="cancel">Cancel upload</button>
         <button type="button" class="delete">Clear files</button>
      </div>
   </form>
   <div class="fileupload-content">
      <table class="files">
      </table>
      <div class="fileupload-progressbar"></div>
   </div>
</div>
