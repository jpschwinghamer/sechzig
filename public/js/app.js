// Generated by CoffeeScript 1.9.3
(function() {
  window.sechzig || (window.sechzig = {});

  sechzig.backing = {
    initialize: function() {},
    setStickyScene: function(scene) {
      this.backing = scene.object.find('.backing');
      switch (scene.sticky) {
        case "top":
          if (sechzig.scroll.scrollTop < scene.top) {
            return this.backing.css({
              'position': 'static',
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
              'position': 'static',
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

  $(function() {
    return sechzig.backing.initialize();
  });

  sechzig.blocking = {
    initialize: function() {
      var movement;
      return this.movements = [
        movement = {
          'section': 'scene-one',
          'character': ".thang",
          'startTime': 0.5,
          'finishTime': 0.9,
          'startValues': {
            'opacity': 1,
            'translateY': 0
          },
          'finishValues': {
            'opacity': -1.75,
            'translateY': -50
          }
        }, movement = {
          'section': 'scene-one',
          'character': ".theng",
          'startTime': 0.5,
          'finishTime': 0.9,
          'startValues': {
            'opacity': 1,
            'translateY': 0,
            'scale': 1
          },
          'finishValues': {
            'opacity': -1.75,
            'translateY': -100,
            'scale': 2
          }
        }
      ];
    },
    assignMovements: function(section) {
      var i, len, movement, ref, sectionMovements;
      sectionMovements = [];
      ref = sechzig.blocking.movements;
      for (i = 0, len = ref.length; i < len; i++) {
        movement = ref[i];
        if (movement.section === section) {
          sechzig.movement.setDefaultMovements(movement);
          sectionMovements.push(movement);
        }
      }
      return sectionMovements;
    },
    getBlockingProgress: function(scene) {
      var i, len, movement, ref, results;
      ref = scene.blocking;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        movement = ref[i];
        movement.startPixel = (movement.startTime * scene.duration) + scene.top;
        movement.finishPixel = (movement.finishTime * scene.duration) + scene.top;
        if ((sechzig.scroll.scrollBottom >= movement.startPixel) && (sechzig.scroll.scrollBottom <= movement.finishPixel)) {
          movement.totalPixels = movement.finishPixel - movement.startPixel;
          movement.progress = (sechzig.scroll.scrollBottom - movement.startPixel) / movement.totalPixels;
          results.push(sechzig.movement.animateMovement(scene, movement));
        } else {
          results.push(void 0);
        }
      }
      return results;
    }
  };

  $(function() {
    return sechzig.blocking.initialize();
  });

  sechzig.movement = {
    initialize: function() {},
    setDefaultMovements: function(movement) {
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
    },
    animateMovement: function(scene, movement) {
      return $("#" + scene.id + " " + movement.character).css({
        'opacity': movement.finishValues.opacity * movement.progress + movement.startValues.opacity,
        'transform': "translate3d( " + (movement.finishValues.translateX * movement.progress + movement.startValues.translateX) + "vw, " + (movement.finishValues.translateY * movement.progress + movement.startValues.translateY) + "vh, 0) rotate( " + (movement.finishValues.rotate * movement.progress + movement.startValues.rotate) + "deg) scale( " + (movement.finishValues.scale * movement.progress + movement.startValues.scale) + ")"
      });
    }
  };

  $(function() {
    return sechzig.movement.initialize();
  });

  sechzig.raf = {
    callbacks: [],
    initialize: function() {
      return this.rafBreak = false;
    },
    rafBreakCheck: function() {
      if (this.rafBreak === false) {
        requestAnimationFrame(function() {
          $.each(sechzig.raf.callbacks, function() {
            return this.call();
          });
          return sechzig.raf.rafBreak = false;
        });
        return sechzig.raf.rafBreak = true;
      }
    },
    onScroll: function(callback) {
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
    onResize: function(callback) {
      return this.callbacks.push(callback);
    }
  };

  $(function() {
    return sechzig.resize.initialize();
  });

  sechzig.scene = {
    initialize: function() {
      return sechzig.raf.onScroll(sechzig.scene.monitorScenes);
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
        if (sechzig.scene.sceneIsActive(scene)) {
          scene.sceneIsActive = true;
          results.push(sechzig.scene.directActiveScenes(scene));
        } else {
          results.push(scene.sceneIsActive = false);
        }
      }
      return results;
    },
    sceneIsActive: function(scene) {
      return (sechzig.scroll.scrollTop >= scene.top && sechzig.scroll.scrollTop <= scene.bottom) || (sechzig.scroll.scrollBottom >= scene.top && sechzig.scroll.scrollBottom <= scene.bottom);
    },
    directActiveScenes: function(scene) {
      sechzig.scene.getSceneProgress(scene);
      return sechzig.blocking.getBlockingProgress(scene);
    },
    getSceneProgress: function(scene) {
      return scene.progress = Math.max(Math.min((sechzig.scroll.scrollBottom - scene.top) / scene.duration, 1), 0);
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
      return sechzig.resize.onResize(sechzig.scroll.updateScroll);
    },
    enableBindings: function() {
      return $(window).on('scroll', function() {
        sechzig.scroll.scrollTop = $(window).scrollTop();
        sechzig.scroll.scrollBottom = sechzig.scroll.scrollTop + sechzig.scroll.scrollHeight;
        return sechzig.raf.rafBreakCheck();
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
