/*
	A simple class for displaying file information and progress
	Note: This is a demonstration only and not part of SWFUpload.
	Note: Some have had problems adapting this class in IE7. It may not be suitable for your application.
*/

// Constructor
// file is a SWFUpload file object
// targetID is the HTML element id attribute that the FileProgress HTML structure will be added to.
// Instantiating a new FileProgress object with an existing file will reuse/update the existing DOM elements
function FileProgress(file, targetID) {
	this.fileProgressID = file.id;

	this.opacity = 100;
	this.height = 0;

	this.fileProgressWrapper = document.getElementById(this.fileProgressID);

  /* html = <li><div class="right"><span>18.7 KB</span><span><a class="icon-active" href="#"></a></span></div>01.gif</li> */
	if (!this.fileProgressWrapper) {
    this.fileProgressWrapper = document.createElement('li');
    this.fileProgressWrapper.id = this.fileProgressID;
    
    this.fileProgressInfo = document.createElement('div');
    this.fileProgressInfo.className = 'right';    
    this.fileProgressInfo.innerHTML = '<span>' + abbreviateSize(file.size) + '</span><span><a class="icon-active" onclick="swfu.cancelUpload(\'' + file.id +'\');" href="#"></a></span>';
    this.fileProgressStatus = this.fileProgressInfo.childNodes[1];
    
    this.fileProgressWrapper.appendChild(this.fileProgressInfo);    
    this.fileProgressWrapper.appendChild(document.createTextNode(file.name));

    document.getElementById(targetID).appendChild(this.fileProgressWrapper);
	} else {
		this.fileProgressInfo = this.fileProgressWrapper.firstChild;
    this.fileProgressStatus = this.fileProgressInfo.childNodes[1];
	}
	
  this.height = this.fileProgressWrapper.offsetHeight;
	this.setTimer(null);


}

FileProgress.prototype.setTimer = function (timer) {
	this.fileProgressWrapper["FP_TIMER"] = timer;
  //this.fileProgressElement["FP_TIMER"] = timer;
};
FileProgress.prototype.getTimer = function (timer) {
  return this.fileProgressWrapper["FP_TIMER"] || null;
	//return this.fileProgressElement["FP_TIMER"] || null;
};

FileProgress.prototype.reset = function () {
  // nothing to do right now
};

FileProgress.prototype.setProgress = function (percentage) {
  // no progress now... show progress in status column
};
FileProgress.prototype.setComplete = function () {
	// do some css things
  var oSelf = this;
	this.setTimer(setTimeout(function () {
		oSelf.disappear();
	}, 10000));
};
FileProgress.prototype.setError = function () {
	// do some css things
  var oSelf = this;
  this.setTimer(setTimeout(function () {
		oSelf.disappear();
	}, 5000));
};
FileProgress.prototype.setCancelled = function () {
  // do some css things
	var oSelf = this;
	this.setTimer(setTimeout(function () {
		oSelf.disappear();
	}, 1000));
};
FileProgress.prototype.setStatus = function (status) {
	this.fileProgressStatus.innerHTML = status;
  //this.fileProgressElement.childNodes[2].innerHTML = status;
};

FileProgress.prototype.appear = function () {
	if (this.getTimer() !== null) {
		clearTimeout(this.getTimer());
		this.setTimer(null);
	}
	
	if (this.fileProgressWrapper.filters) {
		try {
			this.fileProgressWrapper.filters.item("DXImageTransform.Microsoft.Alpha").opacity = 100;
		} catch (e) {
			// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
			this.fileProgressWrapper.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=100)";
		}
	} else {
		this.fileProgressWrapper.style.opacity = 1;
	}
		
	this.fileProgressWrapper.style.height = "";
	
	this.height = this.fileProgressWrapper.offsetHeight;
	this.opacity = 100;
	this.fileProgressWrapper.style.display = "";
	
};

// Fades out and clips away the FileProgress box.
FileProgress.prototype.disappear = function () {

	var reduceOpacityBy = 15;
	var reduceHeightBy = 4;
	var rate = 30;	// 15 fps

	if (this.opacity > 0) {
		this.opacity -= reduceOpacityBy;
		if (this.opacity < 0) {
			this.opacity = 0;
		}

		if (this.fileProgressWrapper.filters) {
			try {
				this.fileProgressWrapper.filters.item("DXImageTransform.Microsoft.Alpha").opacity = this.opacity;
			} catch (e) {
				// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
				this.fileProgressWrapper.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=" + this.opacity + ")";
			}
		} else {
			this.fileProgressWrapper.style.opacity = this.opacity / 100;
		}
	}

	if (this.height > 0) {
		this.height -= reduceHeightBy;
		if (this.height < 0) {
			this.height = 0;
		}

		this.fileProgressWrapper.style.height = this.height + "px";
	}

	if (this.height > 0 || this.opacity > 0) {
		var oSelf = this;
		this.setTimer(setTimeout(function () {
			oSelf.disappear();
		}, rate));
	} else {
		this.fileProgressWrapper.style.display = "none";
		this.setTimer(null);
	}
};
