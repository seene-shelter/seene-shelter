<div class="embed">
    <div oe-move="trackInteraction($event)" oe-motion="trackInteraction($event)">
       <span ng-controller="SceneInteractionCtrl">
            <span ng-controller="SceneModelCtrl">
               <div class="scene-background" ng-style="{'background-image':'url({{ scene.poster_url | imgTransform:'w1920-r90-b200x150' | relProtocol }})'}"></div>
               <div ng-if="$supports.webgl">
                  <span ng-if="!ready && !$supports.iOS" class="anim-fade-inout">
                    <div class="loader loader-1 scene-loader"></div>
                  </span>
                  <div obvi-model class="scene-oemodel" ng-class="{'ready': !!ready}"></div>
               </div>
               <div ng-if="!$supports.webgl">
                  <div class="center--block col-12 padding--none fill-width overflow-hidden--xy" style="border: 0">
                    <div class="margin-extend--top--100"></div>
                    <iframe ng-src="{{getVideoEmbedUrl(scene)}}" class="story-figure-abs" width="{{$supports.iOS ? '87.5%' : '100%'}}" height="{{$supports.iOS ? '87.5%' : '100%'}}" frameborder="0" seamless="" style="{{$supports.iOS ? 'margin: 0 auto;' : ''}}"></iframe>
                  </div>
               </div>
           </span>
       </span>
    </div>

    <div class="overlay-fade overlay-embed">
        <div ng-include src="'app/users/overlay-small.html.tpl'" class="user-overlay-wrap"></div>
        <a oe-post-top="{state:'root.scene', params:{short_code: scene.short_code}}" href="/s/{{scene.short_code}}" target="_blank" ><div ng-include src="'app/common/templates/heading-brand.html.tpl'" class="heading-brand-overlay"></div></a>
    </div>
</div>