// Generated code. Do not modify.

import Foundation
import Serialization
import VGSL

public final class DivStrokeTemplate: TemplateValue, Sendable {
  public let color: Field<Expression<Color>>?
  public let style: Field<DivStrokeStyleTemplate>? // default value: .divStrokeStyleSolid(DivStrokeStyleSolid())
  public let unit: Field<Expression<DivSizeUnit>>? // default value: dp
  public let width: Field<Expression<Double>>? // constraint: number >= 0; default value: 1

  public convenience init(dictionary: [String: Any], templateToType: [TemplateName: String]) throws {
    self.init(
      color: dictionary.getOptionalExpressionField("color", transform: Color.color(withHexString:)),
      style: dictionary.getOptionalField("style", templateToType: templateToType),
      unit: dictionary.getOptionalExpressionField("unit"),
      width: dictionary.getOptionalExpressionField("width")
    )
  }

  init(
    color: Field<Expression<Color>>? = nil,
    style: Field<DivStrokeStyleTemplate>? = nil,
    unit: Field<Expression<DivSizeUnit>>? = nil,
    width: Field<Expression<Double>>? = nil
  ) {
    self.color = color
    self.style = style
    self.unit = unit
    self.width = width
  }

  private static func resolveOnlyLinks(context: TemplatesContext, parent: DivStrokeTemplate?) -> DeserializationResult<DivStroke> {
    let colorValue = { parent?.color?.resolveValue(context: context, transform: Color.color(withHexString:)) ?? .noValue }()
    let styleValue = { parent?.style?.resolveOptionalValue(context: context, useOnlyLinks: true) ?? .noValue }()
    let unitValue = { parent?.unit?.resolveOptionalValue(context: context) ?? .noValue }()
    let widthValue = { parent?.width?.resolveOptionalValue(context: context, validator: ResolvedValue.widthValidator) ?? .noValue }()
    var errors = mergeErrors(
      colorValue.errorsOrWarnings?.map { .nestedObjectError(field: "color", error: $0) },
      styleValue.errorsOrWarnings?.map { .nestedObjectError(field: "style", error: $0) },
      unitValue.errorsOrWarnings?.map { .nestedObjectError(field: "unit", error: $0) },
      widthValue.errorsOrWarnings?.map { .nestedObjectError(field: "width", error: $0) }
    )
    if case .noValue = colorValue {
      errors.append(.requiredFieldIsMissing(field: "color"))
    }
    guard
      let colorNonNil = colorValue.value
    else {
      return .failure(NonEmptyArray(errors)!)
    }
    let result = DivStroke(
      color: { colorNonNil }(),
      style: { styleValue.value }(),
      unit: { unitValue.value }(),
      width: { widthValue.value }()
    )
    return errors.isEmpty ? .success(result) : .partialSuccess(result, warnings: NonEmptyArray(errors)!)
  }

  public static func resolveValue(context: TemplatesContext, parent: DivStrokeTemplate?, useOnlyLinks: Bool) -> DeserializationResult<DivStroke> {
    if useOnlyLinks {
      return resolveOnlyLinks(context: context, parent: parent)
    }
    var colorValue: DeserializationResult<Expression<Color>> = { parent?.color?.value() ?? .noValue }()
    var styleValue: DeserializationResult<DivStrokeStyle> = .noValue
    var unitValue: DeserializationResult<Expression<DivSizeUnit>> = { parent?.unit?.value() ?? .noValue }()
    var widthValue: DeserializationResult<Expression<Double>> = { parent?.width?.value() ?? .noValue }()
    _ = {
      // Each field is parsed in its own lambda to keep the stack size managable
      // Otherwise the compiler will allocate stack for each intermediate variable
      // upfront even when we don't actually visit a relevant branch
      for (key, __dictValue) in context.templateData {
        _ = {
          if key == "color" {
           colorValue = deserialize(__dictValue, transform: Color.color(withHexString:)).merged(with: colorValue)
          }
        }()
        _ = {
          if key == "style" {
           styleValue = deserialize(__dictValue, templates: context.templates, templateToType: context.templateToType, type: DivStrokeStyleTemplate.self).merged(with: styleValue)
          }
        }()
        _ = {
          if key == "unit" {
           unitValue = deserialize(__dictValue).merged(with: unitValue)
          }
        }()
        _ = {
          if key == "width" {
           widthValue = deserialize(__dictValue, validator: ResolvedValue.widthValidator).merged(with: widthValue)
          }
        }()
        _ = {
         if key == parent?.color?.link {
           colorValue = colorValue.merged(with: { deserialize(__dictValue, transform: Color.color(withHexString:)) })
          }
        }()
        _ = {
         if key == parent?.style?.link {
           styleValue = styleValue.merged(with: { deserialize(__dictValue, templates: context.templates, templateToType: context.templateToType, type: DivStrokeStyleTemplate.self) })
          }
        }()
        _ = {
         if key == parent?.unit?.link {
           unitValue = unitValue.merged(with: { deserialize(__dictValue) })
          }
        }()
        _ = {
         if key == parent?.width?.link {
           widthValue = widthValue.merged(with: { deserialize(__dictValue, validator: ResolvedValue.widthValidator) })
          }
        }()
      }
    }()
    if let parent = parent {
      _ = { styleValue = styleValue.merged(with: { parent.style?.resolveOptionalValue(context: context, useOnlyLinks: true) }) }()
    }
    var errors = mergeErrors(
      colorValue.errorsOrWarnings?.map { .nestedObjectError(field: "color", error: $0) },
      styleValue.errorsOrWarnings?.map { .nestedObjectError(field: "style", error: $0) },
      unitValue.errorsOrWarnings?.map { .nestedObjectError(field: "unit", error: $0) },
      widthValue.errorsOrWarnings?.map { .nestedObjectError(field: "width", error: $0) }
    )
    if case .noValue = colorValue {
      errors.append(.requiredFieldIsMissing(field: "color"))
    }
    guard
      let colorNonNil = colorValue.value
    else {
      return .failure(NonEmptyArray(errors)!)
    }
    let result = DivStroke(
      color: { colorNonNil }(),
      style: { styleValue.value }(),
      unit: { unitValue.value }(),
      width: { widthValue.value }()
    )
    return errors.isEmpty ? .success(result) : .partialSuccess(result, warnings: NonEmptyArray(errors)!)
  }

  private func mergedWithParent(templates: [TemplateName: Any]) throws -> DivStrokeTemplate {
    return self
  }

  public func resolveParent(templates: [TemplateName: Any]) throws -> DivStrokeTemplate {
    let merged = try mergedWithParent(templates: templates)

    return DivStrokeTemplate(
      color: merged.color,
      style: merged.style?.tryResolveParent(templates: templates),
      unit: merged.unit,
      width: merged.width
    )
  }
}
