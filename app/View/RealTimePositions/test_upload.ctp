 <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <div class="col-sm-12">
            <form class="form-horizontal" action="/RealTimePositions/upload" method="post">
                <div style="display:none;">
                    <input type="hidden" name="_method" value="POST"/>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">user_route_id</label>
                    <div class="col-md-9">
                        <input type="text" name="data[RealTimePosition][user_route_id]" class="form-control" placeholder="user_route_id" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">latitude</label>
                    <div class="col-md-9">
                        <input type="text" name="data[RealTimePosition][latitude]" class="form-control" placeholder="latitude" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">longitude</label>
                    <div class="col-md-9">
                        <input type="text" name="data[RealTimePosition][longitude]" class="form-control" placeholder="longitude" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">heading</label>
                    <div class="col-md-9">
                        <input type="text" name="data[RealTimePosition][heading]" class="form-control" placeholder="heading" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-3"></div>
</div>
