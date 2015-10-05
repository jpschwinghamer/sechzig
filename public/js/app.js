// Generated by CoffeeScript 1.9.3
(function() {
  var movement;

  window.sechzig || (window.sechzig = {});

  sechzig.backing = {
    setStickyScene: function(scene) {
      this.backing = scene.object.find('.backing');
      switch (scene.sticky) {
        case "top":
          if (sechzig.scroll.scrollTop < scene.top) {
            return this.backing.css({
              'position': 'relative',
              'bottom': 0,
              'top': 0
            });
          } else {
            if (sechzig.scroll.scrollBottom <= scene.bottom) {
              return this.backing.css({
                'position': 'fixed',
                'bottom': 'auto',
                'top': 0
              });
            } else {
              return this.backing.css({
                'position': 'absolute',
                'bottom': 0,
                'top': 'auto'
              });
            }
          }
          break;
        case "bottom":
          if (sechzig.scroll.scrollBottom < scene.top) {
            return this.backing.css({
              'position': 'relative',
              'bottom': 0,
              'top': 0
            });
          } else {
            if (sechzig.scroll.scrollBottom <= scene.bottom) {
              return this.backing.css({
                'position': 'fixed',
                'bottom': 'auto',
                'top': 0
              });
            } else {
              return this.backing.css({
                'position': 'absolute',
                'bottom': '0',
                'top': 'auto'
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
      var i, len, movement, ref, sceneMovements;
      sceneMovements = [];
      ref = sechzig.blocking.keyframes;
      for (i = 0, len = ref.length; i < len; i++) {
        movement = ref[i];
        if (movement.scene === scene) {
          sechzig.blocking.setDefaultMovements(movement);
          sechzig.blocking.setMovementObject(movement);
          sceneMovements.push(movement);
        }
      }
      return sceneMovements;
    },
    setDefaultMovements: function(movement) {
      if (movement.type == null) {
        movement.type = "css-animation";
      }
      if (movement.type === "css-animation") {
        if (movement.startValues.opacity == null) {
          movement.startValues.opacity = 1;
        }
        if (movement.startValues.translateX == null) {
          movement.startValues.translateX = 0;
        }
        if (movement.startValues.translateY == null) {
          movement.startValues.translateY = 0;
        }
        if (movement.startValues.rotate == null) {
          movement.startValues.rotate = 0;
        }
        if (movement.startValues.scale == null) {
          movement.startValues.scale = 1;
        }
        if (movement.finishValues.opacity == null) {
          movement.finishValues.opacity = movement.startValues.opacity;
        }
        if (movement.finishValues.translateX == null) {
          movement.finishValues.translateX = movement.startValues.translateX;
        }
        if (movement.finishValues.translateY == null) {
          movement.finishValues.translateY = movement.startValues.translateY;
        }
        if (movement.finishValues.rotate == null) {
          movement.finishValues.rotate = movement.startValues.rotate;
        }
        if (movement.finishValues.scale == null) {
          return movement.finishValues.scale = movement.startValues.scale;
        }
      }
    },
    getBlockingProgress: function(scene) {
      var i, len, movement, ref, results;
      ref = scene.blocking;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        movement = ref[i];
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
    }
  };

  sechzig.keyframes = [
    movement = {
      'type': 'play-video',
      'scene': 'scene-five',
      'character': "video",
      'startTime': 0,
      'finishTime': 0.75
    }, movement = {
      'scene': 'scene-three',
      'character': ".character",
      'startTime': 0,
      'finishTime': 0.5,
      'startValues': {
        'rotate': 0
      },
      'finishValues': {
        'rotate': 180
      }
    }, movement = {
      'scene': 'scene-two',
      'character': ".theng",
      'startTime': 0,
      'finishTime': 0.5,
      'startValues': {
        'scale': 4
      },
      'finishValues': {
        'scale': 1
      }
    }, movement = {
      'scene': 'scene-two',
      'character': ".thing",
      'startTime': 0.25,
      'finishTime': 0.5,
      'startValues': {
        'opacity': 0,
        'scale': 0.8
      },
      'finishValues': {
        'opacity': 1,
        'scale': 1
      }
    }, movement = {
      'scene': 'scene-four',
      'character': ".theng",
      'startTime': 0.25,
      'finishTime': 0.5,
      'startValues': {
        'translateX': 0
      },
      'finishValues': {
        'translateX': -25
      }
    }, movement = {
      'scene': 'scene-four',
      'character': ".theng",
      'startTime': 0.5,
      'finishTime': 0.75,
      'startValues': {
        'translateX': -25,
        'translateY': 0
      },
      'finishValues': {
        'translateX': -25,
        'translateY': -25,
        'opacity': 0
      }
    }, movement = {
      'scene': 'scene-four',
      'character': ".thang",
      'startTime': 0.25,
      'finishTime': 0.5,
      'startValues': {
        'translateX': 0
      },
      'finishValues': {
        'translateX': 25
      }
    }, movement = {
      'scene': 'scene-four',
      'character': ".thang",
      'startTime': 0.5,
      'finishTime': 0.75,
      'startValues': {
        'translateX': 25,
        'translateY': 0
      },
      'finishValues': {
        'translateX': 25,
        'translateY': 25,
        'opacity': 0
      }
    }
  ];

  sechzig.movement = {
    initialize: function() {},
    directMovement: function(movement) {
      switch (movement.type) {
        case "css-animation":
          return sechzig.movement.animateCSS(movement);
        case "scrub-video":
          movement.video = movement.object[0];
          return sechzig.movement.scrubVideo(movement);
        case "play-video":
          movement.video = movement.object[0];
          if (!movement.movementIsActive) {
            return sechzig.movement.playVideo(movement);
          }
      }
    },
    animateCSS: function(movement) {
      return $("#" + movement.scene + " " + movement.character).css({
        'opacity': sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.opacity, movement.finishValues.opacity - movement.startValues.opacity, movement.pixelDistance),
        'transform': "translate3d( " + (sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.translateX, movement.finishValues.translateX - movement.startValues.translateX, movement.pixelDistance)) + "vw, " + (sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.translateY, movement.finishValues.translateY - movement.startValues.translateY, movement.pixelDistance)) + "vh, 0) rotate( " + (sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.rotate, movement.finishValues.rotate - movement.startValues.rotate, movement.pixelDistance)) + "deg) scale( " + (sechzig.easing.quadInOut(movement.pixelProgress, movement.startValues.scale, movement.finishValues.scale - movement.startValues.scale, movement.pixelDistance)) + ")"
      });
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

  $(function() {
    return sechzig.movement.initialize();
  });

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
      var i, len, ref, results, scene;
      ref = sechzig.stage.scenes;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        scene = ref[i];
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

}).call(this);
