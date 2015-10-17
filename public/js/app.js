// Generated by CoffeeScript 1.9.3
(function() {
  var movement;

  window.sechzig || (window.sechzig = {});

  sechzig.animation = {
    initialize: function(movement) {
      var blur, character, delay, easing, opacity, rotate, scale, translate;
      character = $("#" + movement.scene + " " + movement.character);
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
      character = $("#" + movement.scene + " " + movement.character);
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
      character = $("#" + movement.scene + " " + movement.character);
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
    setStickyScene: function(scene) {
      this.backing = scene.object.find('.backing');
      switch (scene.sticky) {
        case "top":
          if (sechzig.scroll.scrollTop < scene.top) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 0
            });
          } else {
            if (sechzig.scroll.scrollBottom <= scene.bottom) {
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
        case "bottom":
          if (sechzig.scroll.scrollBottom < scene.top) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 0
            });
          } else {
            if (sechzig.scroll.scrollBottom <= scene.bottom) {
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
          if (sechzig.scroll.scrollBottom < scene.top) {
            return this.backing.css({
              position: 'relative',
              bottom: 0,
              top: 0,
              visibility: 'hidden'
            });
          } else {
            if (sechzig.scroll.scrollTop >= scene.bottom) {
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
    assignMovements: function(scene) {
      var j, len, movement, ref, sceneMovements;
      sceneMovements = [];
      ref = sechzig.blocking.keyframes;
      for (j = 0, len = ref.length; j < len; j++) {
        movement = ref[j];
        if (movement.scene === scene) {
          sechzig.blocking.setDefaultMovements(movement);
          sechzig.blocking.setMovementObject(movement);
          if (movement.type === "play-css-animation") {
            if (!movement.played) {
              sechzig.animation.initialize(movement);
            }
          }
          if (movement.type === "play-video" || movement.type === "scrub-video") {
            sechzig.video.initialize(movement);
          }
          if (movement.type === "scrub-canvas" || movement.type === "draw-canvas") {
            sechzig.canvas.initialize(movement);
          }
          sceneMovements.push(movement);
        }
      }
      return sceneMovements;
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
    getBlockingProgress: function(scene) {
      var j, len, movement, ref, results;
      ref = scene.blocking;
      results = [];
      for (j = 0, len = ref.length; j < len; j++) {
        movement = ref[j];
        movement.startPixel = (movement.startTime * scene.duration) + scene.top;
        movement.finishPixel = (movement.finishTime * scene.duration) + scene.top;
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
      return movement.object = $("#" + (movement.scene + " " + movement.character));
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
      scene: 'scene-one',
      character: '.marker',
      type: 'play-css-animation',
      startTime: 0.5,
      finishTime: 0.75,
      duration: 1,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: 'h3',
      type: 'play-css-animation',
      startTime: 0.25,
      finishTime: 0.75,
      duration: 1,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(1) h6',
      type: 'play-css-animation',
      delay: 0.125,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(1) .bar',
      type: 'play-css-animation',
      delay: 0.125,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1],
        transform: {
          translate: [
            {
              x: -100,
              y: 0
            }, {
              x: 0,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(2) h6',
      type: 'play-css-animation',
      delay: 0.25,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(2) .bar',
      type: 'play-css-animation',
      delay: 0.25,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1],
        transform: {
          translate: [
            {
              x: -100,
              y: 0
            }, {
              x: -20,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(3) h6',
      type: 'play-css-animation',
      delay: 0.375,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(3) .bar',
      type: 'play-css-animation',
      delay: 0.375,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1],
        transform: {
          translate: [
            {
              x: -100,
              y: 0
            }, {
              x: -40,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(4) h6',
      type: 'play-css-animation',
      delay: 0.5,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(4) .bar',
      type: 'play-css-animation',
      delay: 0.5,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1],
        transform: {
          translate: [
            {
              x: -100,
              y: 0
            }, {
              x: -17,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(5) h6',
      type: 'play-css-animation',
      delay: 0.675,
      startTime: 0.25,
      finishTime: 1,
      duration: 0.75,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-two',
      character: '.item:nth-child(5) .bar',
      type: 'play-css-animation',
      delay: 0.675,
      startTime: 0.25,
      finishTime: 0.75,
      duration: 0.75,
      values: {
        opacity: [0, 1],
        transform: {
          translate: [
            {
              x: -100,
              y: 0
            }, {
              x: -30,
              y: 0
            }
          ]
        }
      }
    }, movement = {
      scene: 'scene-three',
      character: '.marker',
      type: 'scrub-css-animation',
      startTime: 0.25,
      finishTime: 0.5,
      values: {
        opacity: [0, 1]
      }
    }, movement = {
      scene: 'scene-four',
      character: '.step1',
      startTime: 0.0,
      finishTime: 0.2,
      values: {
        opacity: [-1, 1]
      }
    }, movement = {
      scene: 'scene-four',
      character: '.horz-gallery',
      startTime: 0.20,
      finishTime: 0.80,
      values: {
        transform: {
          translate: [
            {
              x: 200,
              y: 0
            }, {
              x: -200,
              y: 0
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
          if (!movement.played) {
            return sechzig.animation.playCSS(movement);
          }
          break;
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

  sechzig.scene = {
    initialize: function() {
      return sechzig.raf.register(sechzig.scene.monitorScenes);
    },
    monitorScenes: function() {
      var j, len, ref, results, scene;
      ref = sechzig.stage.scenes;
      results = [];
      for (j = 0, len = ref.length; j < len; j++) {
        scene = ref[j];
        if (scene.sticky !== false) {
          sechzig.backing.setStickyScene(scene);
        }
        if (sechzig.scene.status(scene)) {
          sechzig.scene.setActive(scene);
          results.push(sechzig.scene.directActiveScenes(scene));
        } else {
          results.push(sechzig.scene.setInactive(scene));
        }
      }
      return results;
    },
    status: function(scene) {
      return (sechzig.scroll.scrollTop >= scene.top && sechzig.scroll.scrollTop <= scene.bottom) || (sechzig.scroll.scrollBottom >= scene.top && sechzig.scroll.scrollBottom <= scene.bottom);
    },
    directActiveScenes: function(scene) {
      sechzig.scene.getSceneProgress(scene);
      return sechzig.blocking.getBlockingProgress(scene);
    },
    getSceneProgress: function(scene) {
      return scene.progress = (sechzig.scroll.scrollBottom - scene.top) / scene.duration;
    },
    setActive: function(scene) {
      if (!scene.sceneIsActive) {
        scene.object.trigger('active');
      }
      return scene.sceneIsActive = true;
    },
    setInactive: function(scene) {
      if (scene.sceneIsActive) {
        scene.object.trigger('inactive');
      }
      return scene.sceneIsActive = false;
    }
  };

  $(function() {
    return sechzig.scene.initialize();
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
      sechzig.stage.arrangeScenes();
      return sechzig.scene.monitorScenes();
    }
  };

  $(function() {
    return sechzig.scroll.initialize();
  });

  sechzig.stage = {
    initialize: function() {
      return this.arrangeScenes();
    },
    arrangeScenes: function() {
      this.scenes = [];
      return $('.scene').each(function() {
        var $this, scenesHash;
        $this = $(this);
        scenesHash = {
          id: $this.attr('id'),
          top: $this.offset().top,
          bottom: $this.offset().top + $this.height(),
          height: $this.height(),
          object: $this,
          duration: $this.height() + sechzig.scroll.scrollHeight,
          sceneIsActive: false,
          progress: 0,
          blocking: sechzig.blocking.assignMovements(this.id),
          sticky: $this.data('sticky') || false
        };
        return sechzig.stage.scenes.push(scenesHash);
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
      return $('video')[0].currentTime = 3;
    },
    scrubVideo: function(movement) {
      if (movement.video.networkState === 1) {
        return movement.video.currentTime = sechzig.easing.quadInOut(movement.pixelProgress, 0, movement.video.duration, movement.pixelDistance);
      }
    },
    playVideo: function(movement) {
      if (movement.video.networkState === 1) {
        movement.video.play();
      }
      return movement.object.on('inactive', function() {
        return movement.video.pause();
      });
    }
  };

}).call(this);
