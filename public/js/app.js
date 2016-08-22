// Generated by CoffeeScript 1.10.0
(function() {
  var movement;

  window.sechzig || (window.sechzig = {});

  sechzig.animation = {
    initialize: function(movement) {
      var blur, character, delay, easing, opacity, rotate, scale, translate;
      character = $("#" + movement.cue + " " + movement.character);
      blur = "";
      opacity = "";
      translate = "";
      rotate = "";
      scale = "";
      easing = "cubic-bezier(0.65, 0.05, 0.36, 1)";
      delay = 0;
      if (movement.values.blur != null) {
        blur = "blur(" + movement.values.blur[0] + ")";
      }
      if (movement.values.opacity != null) {
        opacity = movement.values.opacity[0];
      }
      if (movement.values.transform != null) {
        if (movement.values.transform.translate != null) {
          translate = "translate3d(" + movement.values.transform.translate[0].x + "vw," + movement.values.transform.translate[0].y + "vh,0)";
        }
        if (movement.values.transform.rotate != null) {
          rotate = "rotate(" + movement.values.transform.rotate[0] + "deg";
        }
        if (movement.values.transform.scale != null) {
          scale = "scale(" + movement.values.transform.scale[0] + ")";
        }
        if (movement.delay != null) {
          delay = movement.delay;
        }
      }
      character.css({
        webkitFilter: blur,
        opacity: opacity,
        transform: scale + " " + translate + " " + rotate
      });
      movement.object.one('active', function() {
        movement.played = true;
        return character.css({
          transition: "all " + movement.duration + "s " + easing + " " + delay + "s"
        });
      });
      return movement.object.one('inactive', function() {
        return character.css({
          transition: "none"
        });
      });
    },
    scrubCSS: function(movement) {
      var blur, character, opacity, rotate, scale, translate;
      character = $("#" + movement.cue + " " + movement.character);
      blur = "";
      opacity = "";
      translate = "";
      rotate = "";
      scale = "";
      if (movement.values.blur != null) {
        blur = "blur(" + (sechzig.easing.quadInOut(movement.pixelProgress, movement.values.blur[0], movement.values.blur[1] - movement.values.blur[0], movement.pixelDistance)) + "px)";
      }
      if (movement.values.opacity != null) {
        opacity = sechzig.easing.quadInOut(movement.pixelProgress, movement.values.opacity[0], movement.values.opacity[1] - movement.values.opacity[0], movement.pixelDistance);
      }
      if (movement.values.transform != null) {
        if (movement.values.transform.translate != null) {
          translate = "translate3d( " + (sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.translate[0].x, movement.values.transform.translate[1].x - movement.values.transform.translate[0].x, movement.pixelDistance)) + "vw, " + (sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.translate[0].y, movement.values.transform.translate[1].y - movement.values.transform.translate[0].y, movement.pixelDistance)) + "vh, 0)";
        }
        if (movement.values.transform.rotate != null) {
          rotate = "rotate(" + (sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.rotate[0], movement.values.transform.rotate[1] - movement.values.transform.rotate[0], movement.pixelDistance)) + "deg";
        }
        if (movement.values.transform.scale != null) {
          scale = "scale(" + (sechzig.easing.quadInOut(movement.pixelProgress, movement.values.transform.scale[0], movement.values.transform.scale[1] - movement.values.transform.scale[0], movement.pixelDistance)) + ")";
        }
      }
      return character.css({
        webkitFilter: blur,
        opacity: opacity,
        transform: scale + " " + translate + " " + rotate
      });
    },
    playCSS: function(movement) {
      var blur, character, opacity, rotate, scale, translate;
      character = $("#" + movement.cue + " " + movement.character);
      blur = "";
      opacity = "";
      translate = "";
      rotate = "";
      scale = "";
      if (movement.values.blur != null) {
        blur = "blur(" + movement.values.blur[1] + ")";
      }
      if (movement.values.opacity != null) {
        opacity = movement.values.opacity[1];
      }
      if (movement.values.transform != null) {
        if (movement.values.transform.translate != null) {
          translate = "translate3d(" + movement.values.transform.translate[1].x + "vw," + movement.values.transform.translate[1].y + "vh,0)";
        }
        if (movement.values.transform.rotate != null) {
          rotate = "rotate(" + movement.values.transform.rotate[1] + "deg";
        }
        if (movement.values.transform.scale != null) {
          scale = "scale(" + movement.values.transform.scale[1] + ")";
        }
      }
      return character.css({
        webkitFilter: blur,
        opacity: opacity,
        transform: scale + " " + translate + " " + rotate
      });
    }
  };

  window.sechzig || (window.sechzig = {});

  sechzig.backing = {
    setCueClasp: function(cue) {
      this.backing = cue.object.find('.backing');
      switch (cue.clasp) {
        case "top":
          if (sechzig.scroll.scrollTop < cue.top) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 0
            });
          } else {
            if (sechzig.scroll.scrollBottom <= cue.bottom) {
              return this.backing.css({
                position: 'fixed',
                bottom: 'auto',
                top: 0
              });
            } else {
              return this.backing.css({
                position: 'absolute',
                bottom: 0,
                top: 'auto'
              });
            }
          }
          break;
        case "top-hold":
          if (sechzig.scroll.scrollTop > cue.bottom) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 'auto',
              visibility: 'hidden'
            });
          } else {
            if (sechzig.scroll.scrollTop <= cue.top) {
              return this.backing.css({
                position: 'absolute',
                bottom: 'auto',
                top: 0,
                visibility: 'visible'
              });
            } else {
              return this.backing.css({
                position: 'fixed',
                bottom: 'auto',
                top: 0,
                visibility: 'visible'
              });
            }
          }
          break;
        case "bottom":
          if (sechzig.scroll.scrollBottom < cue.top) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 0
            });
          } else {
            if (sechzig.scroll.scrollBottom <= cue.bottom) {
              return this.backing.css({
                position: 'fixed',
                bottom: 'auto',
                top: 0
              });
            } else {
              return this.backing.css({
                position: 'absolute',
                bottom: 0,
                top: 'auto'
              });
            }
          }
          break;
        case "bottom-hold":
          if (sechzig.scroll.scrollBottom < cue.top) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 0,
              visibility: 'hidden'
            });
          } else {
            if (sechzig.scroll.scrollTop >= cue.bottom) {
              return this.backing.css({
                position: 'absolute',
                bottom: 0,
                top: 'auto',
                visibility: 'hidden'
              });
            } else {
              return this.backing.css({
                position: 'fixed',
                bottom: 'auto',
                top: 0,
                visibility: 'visible'
              });
            }
          }
      }
    }
  };

  sechzig.blocking = {
    initialize: function() {
      return this.keyframes = sechzig.keyframes;
    },
    assignMovements: function(cue) {
      var cueMovements, j, len, movement, ref;
      cueMovements = [];
      ref = sechzig.blocking.keyframes;
      for (j = 0, len = ref.length; j < len; j++) {
        movement = ref[j];
        if (movement.cue === cue) {
          sechzig.blocking.setDefaultMovements(movement);
          sechzig.blocking.setMovementObject(movement);
          if (movement.type === "play-css-animation") {
            sechzig.animation.initialize(movement);
          }
          if (movement.type === "play-video" || movement.type === "scrub-video") {
            sechzig.video.initialize(movement);
          }
          if (movement.type === "scrub-canvas" || movement.type === "draw-canvas") {
            sechzig.canvas.initialize(movement);
          }
          cueMovements.push(movement);
        }
      }
      return cueMovements;
    },
    setDefaultMovements: function(movement) {
      if (movement.movementIsActive == null) {
        movement.movementIsActive = false;
      }
      if (movement.type == null) {
        movement.type = "scrub-css-animation";
      }
      if (movement.startTime == null) {
        movement.startTime = 0;
      }
      if (movement.finishTime == null) {
        movement.finishTime = 1;
      }
      if (movement.loop == null) {
        movement.loop = false;
      }
      if (movement.type === "draw-canvas") {
        if (movement.canvasReady == null) {
          movement.canvasReady = false;
        }
      }
      if (movement.type === "play-video") {
        if (movement.muted == null) {
          return movement.muted = false;
        }
      }
    },
    getBlockingProgress: function(cue) {
      var j, len, movement, ref, results;
      ref = cue.blocking;
      results = [];
      for (j = 0, len = ref.length; j < len; j++) {
        movement = ref[j];
        movement.startPixel = (movement.startTime * cue.duration) + cue.top;
        movement.finishPixel = (movement.finishTime * cue.duration) + cue.top;
        movement.pixelDistance = movement.finishPixel - movement.startPixel;
        movement.pixelProgress = sechzig.scroll.scrollBottom - movement.startPixel;
        if (sechzig.blocking.status(movement)) {
          sechzig.movement.directMovement(movement);
          results.push(sechzig.blocking.setActive(movement));
        } else {
          results.push(sechzig.blocking.setInactive(movement));
        }
      }
      return results;
    },
    setMovementObject: function(movement) {
      return movement.object = $("#" + (movement.cue + " " + movement.character));
    },
    status: function(movement) {
      return (sechzig.scroll.scrollBottom >= movement.startPixel) && (sechzig.scroll.scrollBottom <= movement.finishPixel);
    },
    setActive: function(movement) {
      if (!movement.movementIsActive) {
        movement.object.trigger('active');
      }
      return movement.movementIsActive = true;
    },
    setInactive: function(movement) {
      if (movement.movementIsActive) {
        movement.object.trigger('inactive');
      }
      return movement.movementIsActive = false;
    }
  };

  $(function() {
    return sechzig.blocking.initialize();
  });

  sechzig.canvas = {
    initialize: function(movement) {
      movement.canvas = movement.object[0];
      movement.context = movement.canvas.getContext('2d');
      movement.images = [];
      movement.playCount = 1;
      return this.buildImages(movement);
    },
    buildImages: function(movement) {
      var i, img, j, ref;
      for (i = j = 1, ref = movement.imageCount; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
        img = new Image;
        img.src = (movement.imagePath + i) + "." + movement.imageType;
        movement.images.push(img);
      }
      return sechzig.canvas.getImageSize(movement);
    },
    getImageSize: function(movement) {
      return $(movement.images[movement.imageCount - 1]).on("load", function() {
        movement.imageWidth = this.width;
        movement.imageHeight = this.height;
        return sechzig.canvas.setCanvasSize(movement);
      });
    },
    setCanvasSize: function(movement) {
      movement.object.attr({
        width: movement.imageWidth,
        height: movement.imageHeight
      });
      movement.object.css({
        width: movement.imageWidth / 2,
        height: movement.imageHeight / 2
      });
      return sechzig.canvas.preDraw(movement);
    },
    preDraw: function(movement) {
      var image, j, len, ref;
      ref = movement.images;
      for (j = 0, len = ref.length; j < len; j++) {
        image = ref[j];
        movement.context.drawImage(image, 0, 0);
      }
      movement.context.drawImage(movement.images[0], 0, 0);
      return movement.canvasReady = true;
    },
    scrubCanvas: function(movement) {
      var frame;
      frame = Math.max(Math.min(Math.floor(sechzig.easing.expoInOut(movement.pixelProgress, 0, movement.imageCount, movement.pixelDistance)), movement.imageCount), 0);
      return movement.context.drawImage(movement.images[frame], 0, 0, movement.imageWidth, movement.imageHeight);
    },
    drawCanvas: function(movement) {
      if (movement.playCount < movement.imageCount) {
        return movement.context.drawImage(movement.images[movement.playCount++], 0, 0, movement.imageWidth, movement.imageHeight);
      } else {
        movement.playCount = 1;
        if (movement.loop === false) {
          return movement.canvasReady = false;
        }
      }
    }
  };

  sechzig.cue = {
    initialize: function() {
      return sechzig.raf.register(sechzig.cue.monitorCues);
    },
    monitorCues: function() {
      var cue, j, len, ref, results;
      ref = sechzig.stage.cues;
      results = [];
      for (j = 0, len = ref.length; j < len; j++) {
        cue = ref[j];
        if (cue.clasp !== false) {
          sechzig.backing.setCueClasp(cue);
        }
        if (sechzig.cue.status(cue)) {
          sechzig.cue.setActive(cue);
          results.push(sechzig.cue.directActiveCues(cue));
        } else {
          results.push(sechzig.cue.setInactive(cue));
        }
      }
      return results;
    },
    status: function(cue) {
      return (sechzig.scroll.scrollTop >= cue.top && sechzig.scroll.scrollTop <= cue.bottom) || (sechzig.scroll.scrollBottom >= cue.top && sechzig.scroll.scrollBottom <= cue.bottom);
    },
    directActiveCues: function(cue) {
      sechzig.cue.getCueProgress(cue);
      return sechzig.blocking.getBlockingProgress(cue);
    },
    getCueProgress: function(cue) {
      return cue.progress = (sechzig.scroll.scrollBottom - cue.top) / cue.duration;
    },
    setActive: function(cue) {
      if (!cue.cueIsActive) {
        cue.object.trigger('active');
      }
      return cue.cueIsActive = true;
    },
    setInactive: function(cue) {
      if (cue.cueIsActive) {
        cue.object.trigger('inactive');
      }
      return cue.cueIsActive = false;
    }
  };

  $(function() {
    return sechzig.cue.initialize();
  });

  sechzig.easing = {
    linear: function(progress, startValue, valueChange, duration) {
      return valueChange * progress / duration + startValue;
    },
    quadInOut: function(progress, startValue, valueChange, duration) {
      if ((progress = progress / (duration / 2)) < 1) {
        return valueChange / 2 * progress * progress + startValue;
      } else {
        return -valueChange / 2 * ((progress -= 1) * (progress - 2) - 1) + startValue;
      }
    },
    expoInOut: function(progress, startValue, valueChange, duration) {
      if (progress === 0) {
        return startValue;
      } else if (progress === duration) {
        return startValue + valueChange;
      } else if ((progress = progress / (duration / 2)) < 1) {
        return valueChange / 2 * Math.pow(2, 10 * (progress - 1)) + startValue;
      } else {
        return valueChange / 2 * (-Math.pow(2, -10 * (progress - 1)) + 2) + startValue;
      }
    }
  };

  sechzig.keyframes = [
    movement = {
      cue: "stage",
      character: ".stage-progress-bar",
      type: "scrub-css-animation",
      startTime: 0.1,
      finishTime: 0.9,
      values: {
        transform: {
          translate: [
            {
              x: 0,
              y: 0
            }, {
              x: 100,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      cue: "scene-seven",
      character: ".scene-progress-bar",
      type: "scrub-css-animation",
      startTime: 0,
      finishTime: 1,
      values: {
        transform: {
          translate: [
            {
              x: 0,
              y: 0
            }, {
              x: 100,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      cue: "scene-eight",
      character: ".thing1",
      type: "scrub-css-animation",
      startTime: 0.2,
      finishTime: 0.6,
      values: {
        transform: {
          translate: [
            {
              x: 0,
              y: 0
            }, {
              x: 0,
              y: 100
            }
          ]
        }
      }
    }, movement = {
      cue: "scene-eight",
      character: ".thing2",
      type: "scrub-css-animation",
      startTime: 0.3,
      finishTime: 0.7,
      values: {
        transform: {
          translate: [
            {
              x: 0,
              y: 0
            }, {
              x: 0,
              y: 100
            }
          ]
        }
      }
    }, movement = {
      cue: "scene-eight",
      character: ".thing3",
      type: "scrub-css-animation",
      startTime: 0.4,
      finishTime: 0.8,
      values: {
        transform: {
          translate: [
            {
              x: 0,
              y: 0
            }, {
              x: 0,
              y: 100
            }
          ]
        }
      }
    }, movement = {
      cue: "scene-eight",
      character: ".thing4",
      type: "scrub-css-animation",
      startTime: 0.5,
      finishTime: 0.9,
      values: {
        transform: {
          translate: [
            {
              x: 0,
              y: 0
            }, {
              x: 0,
              y: 100
            }
          ]
        }
      }
    }
  ];

  sechzig.movement = {
    directMovement: function(movement) {
      switch (movement.type) {
        case "scrub-css-animation":
          return sechzig.animation.scrubCSS(movement);
        case "play-css-animation":
          return sechzig.animation.playCSS(movement);
        case "scrub-video":
          return sechzig.video.scrubVideo(movement);
        case "play-video":
          return sechzig.video.playVideo(movement);
        case "scrub-canvas":
          if (movement.canvasReady) {
            return sechzig.canvas.scrubCanvas(movement);
          }
          break;
        case "draw-canvas":
          if (movement.canvasReady) {
            return sechzig.canvas.drawCanvas(movement);
          }
      }
    }
  };

  sechzig.raf = {
    callbacks: [],
    initialize: function() {
      return this.rafLoop();
    },
    rafLoop: function() {
      return requestAnimationFrame(function() {
        $.each(sechzig.raf.callbacks, function() {
          return this.call();
        });
        return sechzig.raf.rafLoop();
      });
    },
    register: function(callback) {
      return this.callbacks.push(callback);
    }
  };

  $(function() {
    return sechzig.raf.initialize();
  });

  sechzig.resize = {
    callbacks: [],
    initialize: function() {
      return this.enableBindings();
    },
    enableBindings: function() {
      return $(window).on('resize', function() {
        return sechzig.resize.recalcLayout();
      });
    },
    recalcLayout: function() {
      return $.each(this.callbacks, function() {
        return this.call();
      });
    },
    register: function(callback) {
      return this.callbacks.push(callback);
    }
  };

  $(function() {
    return sechzig.resize.initialize();
  });

  sechzig.scroll = {
    initialize: function() {
      this.scrollTop = 0;
      this.scrollHeight = $(window).height();
      this.scrollBottom = this.scrollHeight;
      this.enableBindings();
      return sechzig.resize.register(sechzig.scroll.updateScroll);
    },
    enableBindings: function() {
      return $(window).on('scroll', function() {
        sechzig.scroll.scrollTop = $(window).scrollTop();
        return sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight;
      });
    },
    updateScroll: function() {
      sechzig.scroll.scrollTop = $(window).scrollTop();
      sechzig.scroll.scrollHeight = $(window).height();
      sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight;
      sechzig.stage.arrangeCues();
      return sechzig.cue.monitorCues();
    }
  };

  $(function() {
    return sechzig.scroll.initialize();
  });

  sechzig.stage = {
    initialize: function() {
      return this.arrangeCues();
    },
    arrangeCues: function() {
      this.cues = [];
      return $('.cue').each(function() {
        var $this, cueHash;
        $this = $(this);
        cueHash = {
          id: $this.attr('id'),
          top: $this.offset().top,
          bottom: $this.offset().top + $this.height(),
          height: $this.height(),
          object: $this,
          duration: $this.height() + sechzig.scroll.scrollHeight,
          cueIsActive: false,
          progress: 0,
          blocking: sechzig.blocking.assignMovements(this.id),
          clasp: $this.data('clasp') || false
        };
        return sechzig.stage.cues.push(cueHash);
      });
    }
  };

  $(function() {
    return sechzig.stage.initialize();
  });

  sechzig.video = {
    initialize: function(movement) {
      movement.video = movement.object[0];
      movement.object.prop('loop', movement.loop);
      movement.object.prop('muted', movement.muted);
      if (movement.video.duration) {
        return $('video')[0].currentTime = 0;
      }
    },
    scrubVideo: function(movement) {
      if (movement.video.duration) {
        return movement.video.currentTime = sechzig.easing.quadInOut(movement.pixelProgress, 0, movement.video.duration, movement.pixelDistance);
      }
    },
    playVideo: function(movement) {
      if (movement.video.networkState === 1 && movement.video.duration) {
        movement.video.play();
      }
      return movement.object.on('inactive', function() {
        return movement.video.pause();
      });
    }
  };

}).call(this);
