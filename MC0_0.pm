# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package CAD::Format::DWG::MC0_0;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ENTITIES_TMP_INSERT = -14;
our $ENTITIES_TMP_SOLID = -11;
our $ENTITIES_TMP_TRACE = -9;
our $ENTITIES_TMP_ARC = -8;
our $ENTITIES_TMP_TEXT = -7;
our $ENTITIES_TMP_SHAPE = -4;
our $ENTITIES_TMP_CIRCLE = -3;
our $ENTITIES_TMP_POINT = -2;
our $ENTITIES_TMP_LINE = -1;
our $ENTITIES_LINE = 1;
our $ENTITIES_POINT = 2;
our $ENTITIES_CIRCLE = 3;
our $ENTITIES_SHAPE = 4;
our $ENTITIES_REPEAT_BEGIN = 5;
our $ENTITIES_REPEAT_END = 6;
our $ENTITIES_TEXT = 7;
our $ENTITIES_ARC = 8;
our $ENTITIES_TRACE = 9;
our $ENTITIES_LOAD = 10;
our $ENTITIES_SOLID = 11;
our $ENTITIES_BLOCK_BEGIN = 12;
our $ENTITIES_BLOCK_END = 13;
our $ENTITIES_INSERT = 14;

our $UNIT_TYPES_SCIENTIFIC = 1;
our $UNIT_TYPES_DECIMAL = 2;
our $UNIT_TYPES_ENGINEERING = 3;
our $UNIT_TYPES_ARCHITECTURAL = 4;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = CAD::Format::DWG::MC0_0::Header->new($self->{_io}, $self, $self->{_root});
    $self->{entities} = ();
    my $n_entities = $self->header()->number_of_entities();
    for (my $i = 0; $i < $n_entities; $i++) {
        push @{$self->{entities}}, CAD::Format::DWG::MC0_0::Entity->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

########################################################################
package CAD::Format::DWG::MC0_0::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(12), 0, 0));
    $self->{insertion_base} = CAD::Format::DWG::MC0_0::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{number_of_bytes} = $self->{_io}->read_s4le();
    $self->{number_of_entities} = $self->{_io}->read_s2le();
    $self->{drawing_first} = CAD::Format::DWG::MC0_0::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{drawing_second} = CAD::Format::DWG::MC0_0::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{limits_min} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{limits_max} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_ctrl} = CAD::Format::DWG::MC0_0::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{snap} = $self->{_io}->read_s2le();
    $self->{snap_resolution} = $self->{_io}->read_f8le();
    $self->{grid} = $self->{_io}->read_s2le();
    $self->{grid_unit} = $self->{_io}->read_f8le();
    $self->{ortho} = $self->{_io}->read_s2le();
    $self->{regen} = $self->{_io}->read_s2le();
    $self->{fill} = $self->{_io}->read_s2le();
    $self->{text_size} = $self->{_io}->read_f8le();
    $self->{trace_width} = $self->{_io}->read_f8le();
    $self->{current_layer} = $self->{_io}->read_s2le();
    $self->{current_color} = $self->{_io}->read_s2le();
    $self->{layers} = ();
    my $n_layers = 128;
    for (my $i = 0; $i < $n_layers; $i++) {
        push @{$self->{layers}}, $self->{_io}->read_s2le();
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub insertion_base {
    my ($self) = @_;
    return $self->{insertion_base};
}

sub number_of_bytes {
    my ($self) = @_;
    return $self->{number_of_bytes};
}

sub number_of_entities {
    my ($self) = @_;
    return $self->{number_of_entities};
}

sub drawing_first {
    my ($self) = @_;
    return $self->{drawing_first};
}

sub drawing_second {
    my ($self) = @_;
    return $self->{drawing_second};
}

sub limits_min {
    my ($self) = @_;
    return $self->{limits_min};
}

sub limits_max {
    my ($self) = @_;
    return $self->{limits_max};
}

sub view_ctrl {
    my ($self) = @_;
    return $self->{view_ctrl};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub snap {
    my ($self) = @_;
    return $self->{snap};
}

sub snap_resolution {
    my ($self) = @_;
    return $self->{snap_resolution};
}

sub grid {
    my ($self) = @_;
    return $self->{grid};
}

sub grid_unit {
    my ($self) = @_;
    return $self->{grid_unit};
}

sub ortho {
    my ($self) = @_;
    return $self->{ortho};
}

sub regen {
    my ($self) = @_;
    return $self->{regen};
}

sub fill {
    my ($self) = @_;
    return $self->{fill};
}

sub text_size {
    my ($self) = @_;
    return $self->{text_size};
}

sub trace_width {
    my ($self) = @_;
    return $self->{trace_width};
}

sub current_layer {
    my ($self) = @_;
    return $self->{current_layer};
}

sub current_color {
    my ($self) = @_;
    return $self->{current_color};
}

sub layers {
    my ($self) = @_;
    return $self->{layers};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::MC0_0::Entity::EntityCommon->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->entity_common()->entity_type();
    if ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_SOLID) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntitySolid->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_SOLID) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntitySolid->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_SHAPE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityShape->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_CIRCLE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityCircle->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_TRACE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityTrace->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_INSERT) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityInsert->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_BLOCK_BEGIN) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityBlockBegin->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_LINE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityLine->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_LINE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityLine->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_REPEAT_END) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityRepeatEnd->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_LOAD) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityLoad->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_SHAPE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityShape->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_ARC) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityArc->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TEXT) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityText->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_INSERT) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityInsert->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_CIRCLE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityCircle->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_POINT) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityPoint->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_ARC) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityArc->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_POINT) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityPoint->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TRACE) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityTrace->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::MC0_0::ENTITIES_TMP_TEXT) {
        $self->{data} = CAD::Format::DWG::MC0_0::Entity::EntityText->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntitySolid;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{corner1} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{corner2} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{corner3} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{corner4} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
}

sub corner1 {
    my ($self) = @_;
    return $self->{corner1};
}

sub corner2 {
    my ($self) = @_;
    return $self->{corner2};
}

sub corner3 {
    my ($self) = @_;
    return $self->{corner3};
}

sub corner4 {
    my ($self) = @_;
    return $self->{corner4};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityInsert;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{size} = $self->{_io}->read_s2le();
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->size()), 0, 0));
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{x_scale} = $self->{_io}->read_f8le();
    $self->{y_scale} = $self->{_io}->read_f8le();
    $self->{rotation_angle} = $self->{_io}->read_f8le();
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub x_scale {
    my ($self) = @_;
    return $self->{x_scale};
}

sub y_scale {
    my ($self) = @_;
    return $self->{y_scale};
}

sub rotation_angle {
    my ($self) = @_;
    return $self->{rotation_angle};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityCommon;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_type} = $self->{_io}->read_s1();
    $self->{flag} = $self->{_io}->read_s1();
    $self->{layer} = $self->{_io}->read_s1();
    $self->{flag2} = $self->{_io}->read_s1();
}

sub entity_type {
    my ($self) = @_;
    return $self->{entity_type};
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub layer {
    my ($self) = @_;
    return $self->{layer};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityPoint;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityTrace;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{corner1} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{corner2} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{corner3} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{corner4} = CAD::Format::DWG::MC0_0::Point2d->new($self->{_io}, $self, $self->{_root});
}

sub corner1 {
    my ($self) = @_;
    return $self->{corner1};
}

sub corner2 {
    my ($self) = @_;
    return $self->{corner2};
}

sub corner3 {
    my ($self) = @_;
    return $self->{corner3};
}

sub corner4 {
    my ($self) = @_;
    return $self->{corner4};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityText;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{angle} = $self->{_io}->read_f8le();
    $self->{size} = $self->{_io}->read_s2le();
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->size()), 0, 0));
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityBlockBegin;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name_size} = $self->{_io}->read_s2le();
    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->name_size()), 0, 0));
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub name_size {
    my ($self) = @_;
    return $self->{name_size};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityArc;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{radius} = $self->{_io}->read_f8le();
    $self->{angle_from} = $self->{_io}->read_f8le();
    $self->{angle_to} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

sub angle_from {
    my ($self) = @_;
    return $self->{angle_from};
}

sub angle_to {
    my ($self) = @_;
    return $self->{angle_to};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityCircle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{radius} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityShape;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{angle} = $self->{_io}->read_f8le();
    $self->{item_num} = $self->{_io}->read_s2le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub item_num {
    my ($self) = @_;
    return $self->{item_num};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityLine;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x1} = $self->{_io}->read_f8le();
    $self->{y1} = $self->{_io}->read_f8le();
    $self->{x2} = $self->{_io}->read_f8le();
    $self->{y2} = $self->{_io}->read_f8le();
}

sub x1 {
    my ($self) = @_;
    return $self->{x1};
}

sub y1 {
    my ($self) = @_;
    return $self->{y1};
}

sub x2 {
    my ($self) = @_;
    return $self->{x2};
}

sub y2 {
    my ($self) = @_;
    return $self->{y2};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityRepeatEnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{columns} = $self->{_io}->read_s2le();
    $self->{rows} = $self->{_io}->read_s2le();
    $self->{column_distance} = $self->{_io}->read_f8le();
    $self->{row_distance} = $self->{_io}->read_f8le();
}

sub columns {
    my ($self) = @_;
    return $self->{columns};
}

sub rows {
    my ($self) = @_;
    return $self->{rows};
}

sub column_distance {
    my ($self) = @_;
    return $self->{column_distance};
}

sub row_distance {
    my ($self) = @_;
    return $self->{row_distance};
}

########################################################################
package CAD::Format::DWG::MC0_0::Entity::EntityLoad;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{size} = $self->{_io}->read_s2le();
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->size()), 0, 0));
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::MC0_0::Point2d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::MC0_0::Point3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{z} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

1;
